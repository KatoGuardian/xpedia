<script>
  import { rul } from "./Ruleset";
  import { Link, LinksPage, Value } from "./Components";  
  import Item from "./Item.svelte"
  import TableKey from "./TableKey.svelte";

  export let weapon;

  $: {
    console.log(weapon);
  }
</script>

<div class="launchers">
  <table class="main-table" style="min-width:25rem">
    <tr>
      <td colspan="2" class="table-header">{rul.str("Weapon")}</td>
    </tr>
    {#each Object.entries(weapon).sort((a, b) =>
      a[0] > b[0] ? 1 : -1
      ) as [key, prop]}
      {#if !['type'].includes(key)}
        <tr>
         <TableKey {key} />
         <td>
          <Value val={prop} />
         </td>
        </tr>
      {/if}
    {/each}
  </table>

  <table class="main-table" style="min-width:25rem">
  {#if weapon.launcher}
    <Item item={rul.items[weapon.launcher]} title={rul.str("Launcher") + ": " + rul.str(weapon.launcher)}/>
  {/if}
  {#if weapon.clip}
    <Item item={rul.items[weapon.clip]} title={rul.str("Clip") + ": " + rul.str(weapon.clip)}/>
  {/if}
  </table>
</div>
