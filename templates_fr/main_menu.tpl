{include file="header.tpl"}

{if $isAuthorizedUser}
  <!-- User has logged in -->
<table border="0" class="homeButtons">
  <tr>
    <td colspan="2">&nbsp;<!-- {$isLocalIP} --></td>
  </tr>
  <tr>
    <td colspan="2"><h4>Vous pouvez effectuer les actions suivantes:</h4></td>
  </tr>
  <tr>
    <td>{call name=button href="verify.php" text="Créer un partage" width="100%"}</td>
    <td class="UD_nav_label">Partager (<i>upload</i>)des fichiers avec quelqu'un.</td>
  </tr>
  <tr>
    <td>{call name=button href="pickup.php" text="Récupérer" width="100%"}</td>
    <td class="UD_nav_label">Récupérer (<i>télécharger/download</i>) un fichier partagé avec vous.</td>
  </tr>
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr>
    <td>{call name=button href="req.php" text="Demander un partage" width="100%"}</td>
    <td class="UD_nav_label">Demander un partage de fichier de la part d'une autre personne.</td>
  </tr>
{if $isStatsUser}
	<tr><td colspan="2">&nbsp;</td></tr>
{/if}
{if $isAdminUser}
  <tr>
    <td>{call name=button href="pickup_list_all.php" text="Show All Drop-offs" width="100%" admin=$isAdminUser}</td>
    <td class="UD_nav_label">View all drop-offs in the database (<i>Administrators only</i>).</td>
  </tr>
  <tr>
    <td>{call name=button href="unlock.php" text="Unlock Users" width="100%" admin=$isAdminUser}</td>
    <td class="UD_nav_label">Unlock locked-out users (<i>Administrators only</i>).</td>
  </tr>
{/if}
{if $isStatsUser}
  <tr>
    <td>{call name=button href="stats.php" text="System Statistics" width="100%" admin=$isStatsUser}</td>
    <td class="UD_nav_label">View daily statistics for the dropbox (<i>Administrators only</i>).</td>
  </tr>
{/if}
{if $isAdminUser}
  <tr>
    <td>{call name=button href="log.php" text="System Log" width="100%" admin=$isAdminUser}</td>
    <td class="UD_nav_label">View log file (<i>Administrators only</i>).</td>
  </tr>
{/if}

  <tr><td colspan="2">&nbsp;</td></tr>
</table>

{else}
  <!-- Not logged in. -->
<table border="0" class="homeButtons">
  <tr><td colspan="2"><h4>Si vous êtes {#LocalUser#}, vous pouvez vous connecter ici:</h4></td></tr>
  <tr>
    <td>{call name=button href="index.php?action=login" text="Connexion" width="100%"}</td>
    <td class="UD_nav_label"><b>Évitez de devoir valider votre adresse courriel</b>,<br />et partagez des fichiers avec {#NonLocalUsers#}.</td>
  </tr>
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2"><h4>N'importe qui peut effectuer les actions suivantes:</h4></td></tr>
  <tr>
    <td>{call name=button href="verify.php" text="Créer un partage" width="100%"}</td>
    <td class="UD_nav_label">Partager (<i>upload</i>) un fichier pour {#LocalUser#} (<b>verification par email nécessaire</b>).</td>
  </tr>
  <tr>
    <td>{call name=button href="pickup.php" text="Récuperer" width="100%"}</td>
    <td class="UD_nav_label">Récupérer (<i>télécharger/download</i>) un fichier partagé avec vous.</td>
  </tr>
  <tr><td colspan="2">&nbsp;</td></tr>
</table>

{/if}

<h4>Aide</h4>

<p>{#ServiceTitle#} est un service pour simplifier l'envoi et le partage de fichiers volumineux, jusqu'à un maximum de {$maxFileSize}, à l'extérieur du {#OrganizationType#}.</p>
<ul>
  <li>Si vous faites partie du {#OrganizationType#}, vous pouvez vous connecter avec votre {#Username#} et mot de passe et envoyer des fichiers à n'importe quel destinataire, à l'intérieur ou à l'intérieur du  {#OrganizationType#}.<br/>Créez votre premier partage en vous authentificant et cliquant le bouton "<em>Créer un partage</em>".</li>
  <li>If you are not a member of {#OrganizationType#}, you cannot log in but you can still send files to people in {#OrganizationType#} if you know their email address.<br/>Start by clicking the "<em>Drop-off</em>" button.</li>
  <li>Si vous faites partie du {#OrganizationType#} et voulez demander à quelqu'un à l'extérieur du {#OrganizationType#} de vous envoyer des fichiers, vous pouvez simplifier le procès en cliquant le bouton  "<em>Demander un partage</em>".<br/>Ceci évite certaines étapes d'authentification pour l'autre personne, accélérant le procès de partage.</li>
  <li>Files are automatically deleted from {#ServiceTitle#} {$keepForDays} days after you upload them.</li>
  <li>Les fichiers plus vieux de {$keepForDays} jours sont automatiquement supprimés de {#ServiceTitle#}.</li>

</ul>

{include file="footer.tpl"}
