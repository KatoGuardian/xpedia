<script>
  import { tick, afterUpdate } from "svelte";
  import { rul } from "./Ruleset";
  import { Link, Intro, LinksPage, Value, LinksList } from "./Components";
  import Article from "./Article.svelte";

  export let source;

  let article = null;
  let found = null;
  let query = "";
  let currentSection = null;
  let activeOption;
  let ignoreNextAutoscroll = false;
  let id = "";
  let searchDelayHandle = null;
  let seeSide = true;
  let hugeFont = false;
  let allowHugeFont = false;
  let showDropdown = false;
  let showLanguagesDropdown = false;
  let tooltip;
  let locale = document.location.pathname;

  let isTouch = "ontouchstart" in window;


  async function loadRules() {
    await rul.load(source);
  }

  let rulesLoaded = loadRules();

  function goTo(id) {
    window.location.hash = "##" + id;
  }

  function checkHash() {    
    showDropdown = showLanguagesDropdown = false;
    let hash = decodeURI(document.location.hash);
    if(hash.substr(0,2) != "##")
      return;
    id = hash.substr(2);

    if (id == "MAIN") {
      query = "";
    }
    if (id) {
      let dd = id.indexOf("::");
      if (dd != -1) {
        query = id.substr(dd + 2);
        id = id.substr(0, dd);
      }

      if (id == "SEARCH") {
        if (query.length >= 4)
          found = rul.search.findArticles(query).map(a => a.id);
        else found = 0;
        article = null;
      } else {
        found = null;
        if (!article || article.id != id) article = rul.article(id);
      }

      console.log(id);
      console.log(article);
    }

    if (article) {
      if (article.section && currentSection != article.section)
        currentSection = article.section;
    } else {
      currentSection = null;
    }

    if (activeOption) {
      tick().then(() =>
        activeOption.scrollIntoView({ behavior: "auto", block: "center" })
      );
    }

  }

  function nextArticle(delta) {
    let nextArticle = rul.findNextArticle(article, delta);
    if (nextArticle) {
      goTo(nextArticle.id);
    }
  }

  function searchKeyUp(e) {
    if (searchDelayHandle) clearTimeout(searchDelayHandle);

    searchDelayHandle = setTimeout(
      () => {
        goTo("SEARCH::" + e.target.value);
        searchDelayHandle = null;
      },
      e.key == "Enter" ? 10 : 1000
    );
  }

  function selectSection(id) {
    currentSection = rul.sections[id];
  }

  window.onhashchange = checkHash;

  rulesLoaded.then(checkHash);

  $: {
    console.info(article || "no article");
    //document.documentElement.style.fontSize = hugeFont ? "24pt" : "12pt";
  }

  let sortArticles = false;

  function dropdown(val = null) {
    if (val === null) {
      showDropdown = !showDropdown;
    } else {
      if (!isTouch) showDropdown = val;
    }
  }

  $: sortedArticles = articles =>
    sortArticles
      ? articles.slice().sort((a, b) => (a.title > b.title ? 1 : -1))
      : articles;

  document.addEventListener("keydown", event => {
    const keyName = event.key;
    if (keyName == "ArrowRight") nextArticle(1);
    if (keyName == "ArrowLeft") nextArticle(-1);
  });


  window.addEventListener("mousemove", async e => {
    if (tooltip) {
      let el = e.target;
      while (el && el.attributes && !el.attributes.tooltip) 
        el = el.parentNode;
      
      if (el && el.attributes) {
        let idattr = el.attributes.tooltip;
        let rect = e.target.getBoundingClientRect();
        tooltip.style.left = rect.left + rect.width/2 + "px";
        tooltip.style.top = rect.top + "px";
        let id = idattr.value;
        toggleTooltip(id in rul.lang && !e.shiftKey ? rul.lang[id]:id.substr(4));
      } else {
        toggleTooltip(null)
      }
    }
  });

  function toggleTooltip(text) {
    tooltip.innerHTML = text;
    let classes = tooltip.classList;
    if (text) {
      classes.add("visible");
    } else {
      classes.remove("visible");
    }
  }


</script>

<style>
  .centered {
    position: fixed;
    top: 50%;
    left: 50%;
    width: 100px;
    height: 100px;
    margin-top: -50px;
    margin-left: -50px;
    text-align: center;
  }
</style>

<svelte:head>
  {#if !article}
    <title>BootyPedia</title>
  {/if}
</svelte:head>

{#await rulesLoaded}
  <div class="centered">
    {rul.str('Loading...')}
    <hr />
    <img alt={rul.str('Loading...')} src="xpedia/spinner.svg" />
  </div>
{:then}
  <nav class="navbar flex-horisontal" style="flex-wrap:nowrap">

    <div
      class="navbar-dropdown-container"
      on:mouseover={e => dropdown(true)}
      on:mouseout={e => dropdown(false)}>
      <div class="navbar-button" on:mousedown={e => dropdown()}>
        <img src="xpedia/favicon.png" alt="logo X" class="xpedia-icon" />
        <nobr>
          <span class="on-wide">{rul.modName}&nbsp;&nbsp;{rul.str('BootyPedia')}&nbsp;&nbsp;&nbsp;</span>
          <span style="transform:scale(1.5,0.75); font-weight: bold; display:inline-block;">
            V
          </span>
          &nbsp;
        </nobr>
      </div>

      <div
        class="navbar-dropdown"
        style={showDropdown ? 'visibility:visible' : 'visibility:hidden'}>
        <div class="flex-horisontal" style="flex-wrap:nowrap">
          <div class="navbar-auto navbar-list">
            <div />
            {#each rul.sectionsOrder as section, i}
              <a href={'##' + section.id}>{section.title}</a>
            {/each}
          </div>
          <div class="navbar-custom navbar-list">
            {#each rul.typeSectionsOrder as section, i}
              <a href={'##' + section.id}>{section.title}</a>
            {/each}
          </div>
        </div>
      </div>

    </div>

    <a
      class="navbar-button navbar-current-article on-wide"
      href={'##' + (currentSection ? currentSection.id : 'MAIN')}>
      {currentSection ? currentSection.title : ''}
    </a>

    <div class="stretcher" />
      <div class="navbar-button">
        <a href="##MAIN">
        <img src="xpedia/2.png" alt="Home" class="xpedia-icon main-menu" style="padding-top: 0.3rem"/>
        </a>
      </div>
      <div class="navbar-button">
        <a href="https://openxcom.org/forum/index.php/topic,3626.0.html" target="_blank">
        <img src="xpedia/3.png" alt="DL_link" class="xpedia-icon main-menu" style="padding-top: 0.3rem"/>
        </a>
      </div>
    {#if rul.config && rul.config.languages && rul.config.languages.length > 1}
      <div
        class="navbar-dropdown-container"
        on:mouseover={e => !isTouch && (showLanguagesDropdown = true)}
        on:mouseout={e => !isTouch && (showLanguagesDropdown = false)}>
        <div
          class="navbar-button"
          on:mousedown={e => (showLanguagesDropdown = !showLanguagesDropdown)}>
          {#if "/en-US.html".includes(locale) || "/en-US".includes(locale)}
          <img src="xpedia/images/us.png" alt="en" class="xpedia-icon main-menu"/>
          {:else if "/ru.html".includes(locale) || "/ru".includes(locale)}
          <img src="xpedia/images/ru.png" alt="ru" class="xpedia-icon main-menu"/>
          {:else if "/pl.html".includes(locale) || "/pl".includes(locale)}
          <img src="xpedia/images/pl.png" alt="pl" class="xpedia-icon main-menu"/>
          {:else if "/cs.html".includes(locale) || "/cs".includes(locale)}
          <img src="xpedia/images/cz.png" alt="cs" class="xpedia-icon main-menu"/>
          {:else if "/es-ES.html".includes(locale)}
          <img src="xpedia/images/es.png" alt="es" class="xpedia-icon main-menu"/>
          {:else}
          <img src="xpedia/1.png" alt="Aあ" class="xpedia-icon main-menu"/>
          {/if}
        </div>
        <div
          class="languages-dropdown"
          style={showLanguagesDropdown ? 'visibility:visible' : 'visibility:hidden'}>
          {#each rul.config.languages as lang}
<!--            <a href="{lang.save_as}##{id}">{lang.name}</a>  -->
            {#if "English".includes(lang.name)}
              <div class="languages-image">
              <a href="{lang.save_as}##{id}">
              <img src="xpedia/images/us.png" alt="English">
              </a>
              </div>
            {/if}
            {#if "Русский".includes(lang.name)}
              <div class="languages-image">
              <a href="{lang.save_as}##{id}">
              <img src="xpedia/images/ru.png" alt="Русский">
              </a>
              </div>
            {/if}
            {#if "Polski".includes(lang.name)}
              <div class="languages-image">
              <a href="{lang.save_as}##{id}">
              <img src="xpedia/images/pl.png" alt="Polski">
              </a>
              </div>
            {/if}
            {#if "Čeština".includes(lang.name)}
              <div class="languages-image">
              <a href="{lang.save_as}##{id}">
              <img src="xpedia/images/cz.png" alt="Čeština">
              </a>
              </div>
            {/if}
            {#if "Español".includes(lang.name)}
              <div class="languages-image">
              <a href="{lang.save_as}##{id}">
              <img src="xpedia/images/es.png" alt="Español">
              </a>
              </div>
            {/if}
          {/each}
        </div>
      </div>
    {/if}

    {#if allowHugeFont}
      <button class="navbar-button" on:click={e => (hugeFont = !hugeFont)}>
        <span style="font-size:150%">A</span>
        <span style="font-size:75%">A</span>
      </button>
    {/if}

    <div class="navbar-search">
      <input
        class="input"
        type="text"
        bind:value={query}
        on:keyup={searchKeyUp}
        placeholder={rul.str('Search...')} />
    </div>

  </nav>

  {#if seeSide}
    <nav class="sidebar">

      <button
        class="side-sort-button"
        style={sortArticles ? '' : 'text-decoration:line-through'}
        on:click={e => (sortArticles = !sortArticles)}>
        {rul.str('A-Z')}
      </button>

      {#each article && article.section && article.section.isType() ? rul.typeSectionsOrder : rul.sectionsOrder as section}
        {#if !currentSection || section.id == currentSection.id}
          <p class="menu-label">{section.title}</p>
          <div class="menu-list">
            {#each sortedArticles(section.articles) as option}
              {#if article && article.id == option.id}
                <a
                  href={'##' + option.id}
                  bind:this={activeOption}
                  class="active-article-option side-link">
                  {option.title}
                </a>
              {:else}
                <a
                  class="side-link"
                  href={'##' + option.id}
                  on:click={() => (ignoreNextAutoscroll = true)}>
                  {option.title}
                </a>
              {/if}
            {/each}
          </div>
        {/if}
      {/each}
      <br />
    </nav>
  {/if}

  <button
    class="side-hide-button"
    on:click={e => {
      if (e.button == 0) seeSide = !seeSide;
    }}
    style={seeSide ? '' : 'left:1em;'}>
    <span style="font-size:150%">≡</span>
  </button>

  <div class="main" style={seeSide ? '' : 'padding-left:1rem;'}>

    {#if article}
      <Article
        {article}
        {query}
        on:prev={e => nextArticle(-1)}
        on:next={e => nextArticle(1)} />
    {:else if query}
      {rul.str("Searching")} "
      <em>{query}</em>
      ":
      <br />
      {#if found && found.length > 0}
        <LinksPage links={found} />
      {:else if query.length < 2}
        <i>{rul.str("Query too short")}!</i>
      {:else if searchDelayHandle}
        ...
      {:else}
        <i>{rul.str("Nothing found")}.</i>
      {/if}
    {:else if !query}
      <!--
      {#each rul.sectionsOrder.concat(rul.typeSectionsOrder) as section}
        <h1><a href={'#' + section.id}>{section.title}</a></h1>
        <LinksPage links={section.articles.map(a => a.id)} />
      {/each}-->
      <Intro />
    {/if}
  </div>

  <div class="tooltip fadein" bind:this={tooltip}>Tooltip</div>
{/await}
