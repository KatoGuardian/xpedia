<script>
  import { rul } from "./Ruleset";
  import LinksPage from "./LinksPage.svelte"; 
</script>

<div class="columns">
  <div class="column is-full-touch is-9-desktop">
    <h1>X-PirateZ</h1>
      {rul.str("Welcome onboard, seagal! Take your bunk at da orlop and have some X-Grog, yarrr!")}
    <br/>
    <h4>{rul.str("Arrr, what da FLUFF is X-Piratez stuff?")}</h4>
      {rul.str("X-Piratez is a total conversion mod designed for OpenXcom, a free open-source reimplementation of")} X-Com: Enemy Unknown (1994) {rul.str("and Terror From The Deep. There are major gameplay differences, as well as many additions to research, manufacture, base facilities, and so on. Piratez is designed for the veteran X-Com player seeking a much longer and challenging campaign.")}<br/>
      <br/>
      {rul.str("The year is 2601. The Earth has been long conquered by aliens. You run a gang of mutant pirates. Rob aliens and their human proxies for fun, profit and power. Piratez is the biggest OpenXcom mod to date.")}<br/> 
      <br/>
      <a href="https://openxcom.org/forum/index.php/topic,3626.0.html" target="_blank">{rul.str("Download mod")}</a>, {rul.str("join our community with")} <a href="https://discord.gg/b5KXPvX" target="_blank">{rul.str("Discord server")}</a> {rul.str("and")} <a href="https://openxcom.org/forum/index.php/board,18.0.html" target="_blank">{rul.str("forum")}</a>!<br/>
      <br/>
    <h4>{rul.str("Current mod version is")} K2</h4>
      <div>
        <div class="quote">
          "{rul.str("READ OR DIE. The Bootypedia is your friend. Trust me on that.")}"
        </div>
        <div class="qsign">
          – Dioxine, {rul.str("mod author, lead designer")}
        </div> 
      </div>
      <h4>{rul.str("WARNINGS")}</h4>
      1. {rul.str("Contains some NUDITY of both sexes. You've been warned. Also take note this is not any porn-quality T&A since it's not a porn game.")}<br/>
      2. {rul.str("Do not install OpenXcom nightlies! They are not compatible with Piratez.")}<br/>
      3. {rul.str("If you absolutely can't stand bikini babes fighting Nazis with chainsaws, you may suffer some trauma.")}<br/>
      4. {rul.str("If you're looking for a tactical game that doesn't require brains, try DOTA instead.")}<br/>
      5. {rul.str("Read or Die.")}<br/>
      6. {rul.str("Contains riddles. Not everything is what it seems.")}<br/>
      7. {rul.str("A single campaign might take as much as 400 hours.")}<br/>
    <br/>

    {rul.str("Wiki is powered by")} <a href="https://github.com/baturinsky/xpedia/">Baturinsky's XPedia</a>.

  </div>
  <div class="column is-hidden-touch is-3-desktop">
    <button title="Download" class="downloadbtn" onclick=" window.open('https://openxcom.org/forum/index.php/topic,3626.0.html', '_blank'); return false;">{rul.str("Download (forum link)")}</button>
    <button title="Download" class="downloadbtn" onclick=" window.open('https://openxcom.mod.io/x-piratez', '_blank'); return false;">{rul.str("Download (from mod.io)")}</button>
    <div class="imgcol">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen1209.png" alt="screen1209.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen334.png" alt="screen334.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen757.png" alt="screen757.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen135.png" alt="screen135.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen789.png" alt="screen789.png">
    </div>
  </div>
</div>
  

