<script>
  import { rul } from "./Ruleset";

  export let id;
  export let left = false;
  export let maxWidth = window.innerWidth > 1400 ? 640 : 320;
  export let maxZoom = 4;
  export let style = "";

  function loaded(img) {
    return;
    console.info(img);
    let zoom = Math.min(maxZoom, Math.max(1, Math.floor(maxWidth / img.naturalWidth)))
    img.width = img.naturalWidth * zoom;
    img.height = img.naturalHeight * zoom;
  }

  function noimage(img) {
    img.onerror = null;
    img.src = "xpedia/0.png";
    img.style.border = "none";
  }

  console.log(id);
</script>

{#if id && rul.sprite(id)}
  <a href={rul.sprite(id)} class="illustration">
    <img      
      style={style + (left ? 'float:left' : '')}
      on:load={e => loaded(e.target)}
      on:error={e => noimage(e.target)}
      alt={id || ''}
      src={rul.sprite(id)} />
  </a>
{/if}
