<script>
  import { rul } from "./Ruleset";
  import { Link, Intro, LinksPage, Value, LinksList, BaseServiceList } from "./Components";
  import TableKey from "./TableKey.svelte";
  
  export let research;
  export let title = rul.str("Research");
  let longLists = ['seeAlso', 'requiresBaseFunc', 'manufacture', 'getOneFree', 'freeFrom', 'unlocks', 'dependencies', 'leadsTo', 'disables']

  $: {
    console.log(research);
  }
</script>

  <tr>
    <td colspan="2" class="table-header">{title}</td>
  </tr>
  {#each Object.entries(research).sort((a, b) => (longLists.includes(b[0])?-10:10) + (a[0] > b[0] ? 1 : -1)) as [key, prop]}
    {#if longLists.includes(key) && prop && prop.length>0}
      <tr class="subtable"><td colspan="2">
          <div class="table-subheader">{rul.decamelize(key)}</div>
          <div class="cols" style="columns:2;">
          {#each prop as field, i}
            <div><Link href={field} /></div>
          {/each}
          </div>
      </td></tr>
    {:else if ['requiresBaseFunc' ].includes(key)}
      <BaseServiceList items={prop} vertical={true}/>
    {:else if key == 'getOneFreeProtected'}
      <tr class="subtable"><td colspan="2">
        <div class="table-subheader">{rul.decamelize(key)}</div>
        <div>{#each Object.keys(prop) as key}
          <div class="table-subheader"><Link href={key}/></div>
          <div class="cols" style="columns:2;">
            {#each prop[key] as field, i}
            <div><Link href={field}/></div>
            {/each}
          </div>
        {/each}
        </div>
      </td></tr>   
    {:else}
      {#if !['name'].includes(key)}
        <tr>        
            <TableKey {key} />
            <td>
              <Value val={prop}/>
            </td>
        </tr>
        {/if}
    {/if}  
  {/each}
