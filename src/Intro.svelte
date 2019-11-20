<script>
  import { rul } from "./Ruleset";
  import LinksPage from "./LinksPage.svelte"; 
</script>

<div class="columns">
  <div class="column is-full-touch is-9-desktop">
    <h1>X-PirateZ</h1>
      {rul.str("Welcome onboard, seagal! Take your bunk at da orlop and have some X-Grog, yarrr!")}
    <br/>
    <h4>{rul.str("Arrr, whats dat X-Piratez?")}</h4>
      The year is 2601. The Earth has been long conquered by aliens. You run a gang of mutant pirates. Rob aliens and their human proxies for fun, profit and power. Now with a coustom .exe that allows for a ton of unique features; bigger and better than ever before.<br/>
      Piratez is the biggest Openxcom mod to date and takes weeks to finish.<br/> 
      <br/>
      WARNINGS:<br/>
      1. Contains some NUDITY of both sexes. You've been warned. Also take note this is not any porn-quality T&A since it's not a porn game.<br/>
      2. Do not install Openxcom nightlies! They are not compatible with Piratez.<br/>
      3. If you absolutely can't stand bikini babes fighting Nazis with chainsaws, you may suffer some trauma.<br/>
      4. If you're looking for a tactical game that doesn't require brains, try DOTA instead.<br/>
      5. Read or Die.<br/>
      6. Contains riddles. Not everything is what it seems.<br/>
      7. A single campaign might take as much as 400 hours.<br/>
      <br/>
      <a href="https://openxcom.mod.io/the-x-com-files">{rul.str("Download mod")}</a>, join our community with <a href="https://discord.gg/XrQQTPg">{rul.str("Discord server")}</a> and <a href="https://openxcom.org/forum/index.php/board,21.0.html">forum!</a><br/>
      <br/>
    <h4>{rul.str("Current mod version is")} K2</h4>
      <div>
        <div class="quote">
          "Some words must be here."
        </div>
        <div class="qsign">
          – Dioxine, {rul.str("mod author, lead designer")}
        </div> 
      </div>
      
    <br/>
    <br/>

    Wiki is powered by <a href="https://github.com/baturinsky/xpedia/">Baturinsky's XPedia</a>.

  </div>
  <div class="column is-hidden-touch is-3-desktop">
    <button title="Download" class="downloadbtn" onclick=" window.open('https://openxcom.mod.io/the-x-com-files', '_blank'); return false;">{rul.str("Download")}</button>
    <div class="imgcol">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen1209.png" alt="screen1209.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen334.png" alt="screen334.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen757.png" alt="screen757.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen135.png" alt="screen135.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/077e/249/thumb_1020x2000/screen789.png" alt="screen789.png">
    </div>
  </div>
</div>
  

