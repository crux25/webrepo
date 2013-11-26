{************************************
****** Category Menu Template *******
*************************************}
<!-- categories.tpl -->
<div class="subnav" id="categories">
	<div class="container">
		<ul class="nav nav-pills">
			
			{checkActionsTpl location="tpl_widget_categories_start"}
			{section name=thecat loop=$cat_array}
				{if $cat_array[thecat].auto_id neq 0}
					{if $cat_array[thecat].spacercount < $submit_lastspacer}
						{$cat_array[thecat].spacerdiff|repeat_count:'</ul></li>'}
					{/if}
					{if $cat_array[thecat].spacercount > $submit_lastspacer}
						<ul class="dropdown-menu {if $cat_array[thecat].principlecat eq 0}sub-menu{/if} sub-menu-show sub-menu-hide">
					{/if}
					<li{if $cat_array[thecat].principlecat neq 0} class="dropdown"{/if}>
					<a {if $cat_array[thecat].principlecat neq 0} class="dropdown-toggle active"{/if} href="{if $pagename eq "new" || $groupview eq "new"}{$URL_newcategory, $cat_array[thecat].safename}{else}{$URL_maincategory, $cat_array[thecat].safename}{/if}{if $urlmethod==2}/{/if}">{$cat_array[thecat].name} {if $cat_array[thecat].principlecat neq 0}<b class="caret"></b>{/if}</a>
					{if $cat_array[thecat].principlecat eq 0}
						</li>
					{/if}
					{assign var=submit_lastspacer value=$cat_array[thecat].spacercount}
					
				{/if}
				
			{/section}
			
			{if $cat_array[thecat].spacercount < $submit_lastspacer}{$lastspacer|repeat_count:'</ul></li>'}{/if}
			<!-- START SEARCH BOX -->
		             <script type="text/javascript">
				{if !isset($searchboxtext)}
					{assign var=searchboxtext value=#PLIGG_Visual_Search_SearchDefaultText#}			
				{/if}
				var some_search='{$searchboxtext}';
			     </script>
			     <form action="{$my_pligg_base}/search.php" method="get" name="thisform-search" id="thisform-search" class="navbar-form navbar-left custom_nav_search" role="search" {if $urlmethod==2}onsubmit='document.location.href="{$my_base_url}{$my_pligg_base}/search/"+this.search.value.replace(/\//g,"|").replace(/\?/g,"%3F"); return false;'{/if}>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" tabindex="50" name="search" value="{$searchboxtext}" onfocus="if(this.value == some_search) {ldelim}this.value = '';{rdelim}" onblur="if (this.value == '') {ldelim}this.value = some_search;{rdelim}"/>
				</div>
				<button type="submit" tabindex="21" class="btn btn-default custom_nav_search_button" />{#PLIGG_Visual_Search_Go#}</button>
			    </form>
	                <!-- END SEARCH BOX -->
			{checkActionsTpl location="tpl_widget_categories_end"}
			
		</ul>

	</div>
</div>
<!--/categories.tpl -->
