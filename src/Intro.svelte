<script>
  import { rul } from "./Ruleset";
  import LinksPage from "./LinksPage.svelte"; 
</script>

<div class="columns">
  <div class="column is-full-touch is-9-desktop">
    <h1>X-PirateZ</h1>
      {rul.str("Welcome to The X-COM Files mod to OpenXcom website.")}
    <br/>
    <h4>What is XCF?</h4>
      This megamod is a global conversion to OpenXcom (clone of the classic UFO:Enemy Unknown 1994), preserving the original setting.<br/> 
      <br/>
      With this mod the game starts in 1996. The player gets control over the newly formed organization X-Com - a project of the UN, designed to investigate abnormal events on our planet. The style of the series X-Files (where the name comes from) is surprisingly clear. In the beginning, no fighters, dozens of scientists, millions of dollars in budgets. You only have two special agents and they travel by public transport! Investigate mysterious incidents, tie the evidence together to shed light on extraterrestrial activities, develop X-COM and prepare for an alien invasion from Cidonia!<br/>
      This mod contains many, many additions, like new mission types, enemies, equipment and story arcs (including the entirety of my previous project, the Final Mod Pack). It also places the game a bit more firmly in the 90's conspiracy genre and its clichés.<br/>
      <br/>
      <a href="https://openxcom.mod.io/the-x-com-files">{rul.str("Download mod")}</a>, join our community with <a href="https://discord.gg/XrQQTPg">Discord server</a> and <a href="https://openxcom.org/forum/index.php/board,21.0.html">forum!</a><br/>
      <br/>
    <h4>{rul.str("Current mod version is")} K2</h4>
      <div>
        <div class="quote">
          "Now, this doesn't at all mean that this is the end. I will continue releasing new versions just like before, at least for the foreseeable future... <br/>
          The 1.0 only means that I am satisfied with how the mod works now and consider it "done" enough to say so."
        </div>
        <div class="qsign">
          – Solarius Scorch, mod author, lead designer
        </div> 
      </div>
      
    <br/>
    <br/>

    Wiki is powered by <a href="https://github.com/baturinsky/xpedia/">Baturinsky's XPedia</a>.

  </div>
  <div class="column is-hidden-touch is-3-desktop">
    <button title="Download" class="downloadbtn" onclick=" window.open('https://openxcom.mod.io/the-x-com-files', '_blank'); return false;">{rul.str("Download")}</button>
    <div class="imgcol">
      <img class="imgbox" src="https://thumb.mod.io/mods/0640/158/thumb_1020x2000/osprey.1.png" alt="osprey.1.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/0640/158/thumb_1020x2000/screen072.1.png" alt="screen072.1.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/0640/158/thumb_1020x2000/callofcoding.1.png" alt="callofcoding.1.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/0640/158/thumb_1020x2000/screen070.png" alt="screen070.png">
      <img class="imgbox" src="https://thumb.mod.io/mods/0640/158/thumb_1020x2000/village01.png" alt="village01.png">
    </div>
  </div>
</div>
  

