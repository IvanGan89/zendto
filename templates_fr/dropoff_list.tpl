{include file="header.tpl"}

<script type="text/javascript">
<!--
$(document).ready(function() {
    $('#dropoff_list').dataTable( {
       "sPaginationType": "full_numbers",
       "aaSorting": [[ 4, "desc" ]],
       "aoColumns": [
       { "sTitle": "Claim ID", "bSortable": false, "sClass": "left" },
       { "sTitle": "Sender", "sClass": "left" },
       { "sTitle": "Recipient", "sClass": "left" },
       { "sTitle": "Size", "sClass": "left", "iDataSort":  5  },
       { "sTitle": "Created", "sType": "date-euro", "sClass": "center" },
       { "bVisible":  false }
       ]
    } );
} );
//-->
</script>

{if $isAuthorizedUser}

  {if $countDropoffs>0}
<h1>Envoi</h1>
<h5>Cliquez sur un des ID de partage pour afficher l'information et les fichiers partagés.</h5>
<table id="dropoff_list" width="100%">
  <thead>
<!-- <table class="UD_form" cellpadding="4" width="100%">
  <thead class="UD_form_header"> -->
    <td>ID de partage</td>
    <td>Expéditeur</td>
    <td>Destinataire</td>
    <td>Taille</td>
    <td>Crée</td>
  </thead>

    {foreach from=$dropoffs item=d}
<!--  <tr valign="middle" class="UD_form_lined {cycle values="row,rowalt"}">
    <td class="UD_form_lined"><a class="hoverlink" href="#" onclick="doPickup('{$d.claimID}');"><tt>{$d.claimID}</tt></a></td>
    <td class="UD_form_lined">{$d.senderName}, {$d.senderOrg} ({$d.senderEmail})</td>
    <td class="UD_form_lined">{foreach from=$d.recipients item=r}{$r.name} &lt;{$r.email}&gt;<br/>{/foreach}</td>
    <td class="UD_form_lined">{$d.formattedBytes|replace:' ':'&nbsp;'}</td>
    <td><div style="white-space: nowrap"><tt>{$d.createdDate|date_format:"%d&nbsp;%b&nbsp;%Y&nbsp;%r"}</tt></div></td>
  </tr> -->
  <tr>
    <td><a class="hoverlink" href="#" onclick="doPickup('{$d.claimID}');"><tt>{$d.claimID}</tt></a></td>
    <td>{$d.senderName}, {$d.senderOrg} ({$d.senderEmail})</td>
    <td>{foreach from=$d.recipients item=r}{$r.name} &lt;{$r.email}&gt;<br/>{/foreach}</td>
    <td>{$d.formattedBytes}</td>
    <td align="center">{$d.createdDate|date_format:"%d/%m/%Y %H:%M:%S"}</td>
    <td>{$d.Bytes}</td>
  </tr>
    {/foreach}

<!--  <tr class="UD_form_footer">
    <td colspan="4" align="center">{$countDropoffs} drop-off{if $countDropoffs ne 1}s{/if} {$formattedTotalBytes}</td>
  </tr> -->
</table>

<br/>
  <form name="pickup" method="post" action="{$zendToURL}pickup.php">
  <input type="hidden" id="claimID" name="claimID" value=""/>
</form>

  {else}
<h5>Il n'y a actuellement aucun fichier partagé par vous sur le serveur.</h5>
  {/if}

{/if}

{include file="footer.tpl"}
