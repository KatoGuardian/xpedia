<script>
  import { rul } from "./Ruleset";
  import Armor from './Armor.svelte';
  import TableKey from "./TableKey.svelte";

  import { Link, Intro, LinksPage, Value } from "./Components";
  

  export let unit;

  $: {console.log(unit)}

</script>

  <tr> <td colspan="2" class="table-header">{rul.str("Unit")}</td> </tr>
  {#each Object.entries(unit).sort((a, b) => (a[0] > b[0] ? 1 : -1)) as [key, prop]}
    {#if !['type', 'scripts'].includes(key)}
      <tr>
        <TableKey {key} />
        <td>
          {#if ['builtInWeaponSets'].includes(key)}
            {#each Object.values(prop) as set, i}
              {#if i != 0}<br/> {/if}
              {#if ![i].includes(prop)}{i+1}:{/if}
              {#each set as field, j}                
                {#if j != 0}, {/if}
                <Link href={field}/>
              {/each}              
            {/each}
          {:else}
            <Value val={prop}/>
          {/if}
        </td>
      </tr>
    {/if}
  {/each}
