{if $maintenance_mode eq "true" && $user_level neq 'admin'}{include file=$the_template"/maintenance.tpl"}{else}<!DOCTYPE html>
<html class="no-js" dir="{#PLIGG_Visual_Language_Direction#}" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	{checkActionsTpl location="tpl_pligg_head_start"}
	
	<!-- START META -->
		{include file=$the_template"/meta.tpl"}
	<!-- END META -->
	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.no-icons.min.css" rel="stylesheet">
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/templates/{$the_template}/css/jquery.pnotify.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/templates/{$the_template}/css/style.css" media="screen" />
	<script type="text/javascript" src="{$my_pligg_base}/templates/{$the_template}/js/modernizr.js"></script>

	{if $Voting_Method eq 2}
	<link rel="stylesheet" type="text/css" href="{$my_pligg_base}/templates/{$the_template}/css/star_rating/star.css" media="screen" />
	{/if}
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	{checkForCss}
	{checkForJs}
	
	<!-- START TITLE -->
		{include file=$the_template"/title.tpl"}
	<!-- END TITLE -->
	
	{if $pagename eq "submit"}
		{literal}
			<script type="text/javascript">
		$(function()
		{
			$(".title").keyup(function() 
			{
				var title=$(this).val();
				$(".story_title").html(title);
				return false;
			});
			$(".story_category").keyup(function() 
			{
				var category=$(this).val();
				$(".category").html(category);
				return false;
			});
			$(".story_group").keyup(function() 
			{
				var story_group=$(this).val();
				$(".story_group").html(story_group);
				return false;
			});
			$(".tags").keyup(function() 
			{
				var tags=$(this).val();
				$(".tags").html(tags);
				return false;
			});
			$(".bodytext").keyup(function() 
			{
				var bodytext=$(this).val();
				$(".bodytext").html(bodytext);
				return false;
			});
			
		});
		</script>
		{/literal}
	{/if}
	
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="{$my_base_url}{$my_pligg_base}/rss.php"/>
	<link rel="icon" href="{$my_pligg_base}/favicon.ico" type="image/x-icon"/>
	{checkActionsTpl location="tpl_pligg_head_end"}
</head>
<body dir="{#PLIGG_Visual_Language_Direction#}" {$body_args} {checkActionsTpl location="tpl_pligg_body_onload"}>
	{if $maintenance_mode eq "true" && $user_level eq 'admin'}
		<div class="alert alert-danger" style="margin-bottom:0;"><button class="close" data-dismiss="alert">&times;</button>{#PLIGG_Maintenance_Admin_Warning#}</div>
	{/if}
	
	{checkActionsTpl location="tpl_pligg_body_start"}
	
	<!-- START HEADER -->
		{include file=$tpl_header.".tpl"}
	<!-- END HEADER -->
	
	<!-- START CATEGORIES -->
		{include file=$the_template."/categories.tpl"}
	<!-- END CATEGORIES -->
	
	<div class="container">
		<section id="maincontent">
			<div class="row">
				{checkActionsTpl location="tpl_pligg_banner_top"}
			{if $pagename eq "submit" || $pagename eq "user" || $pagename eq "profile" || $pagename eq "user_edit" || $pagename eq "register" || $pagename eq "login"}
				<div class="col-md-12">
			{else}
				<div class="col-md-9">
			{/if}
					<!-- START BREADCRUMB -->
						{include file=$the_template"/breadcrumb.tpl"}
					<!-- END BREADCRUMB -->
					
					{literal}
						<script type="text/javascript" language="JavaScript">
						function checkForm() {
							answer = true;
							if (siw && siw.selectingSomething)
								answer = false;
							return answer;
						}//
						</script>
					{/literal}
					
					{checkActionsTpl location="tpl_pligg_content_start"}
					{checkActionsTpl location="tpl_pligg_above_center"}
					
					<!-- START CENTER CONTENT -->
						{include file=$tpl_center.".tpl"}
					<!-- END CENTER CONTENT -->
					
					{checkActionsTpl location="tpl_pligg_below_center"}
					{checkActionsTpl location="tpl_pligg_content_end"}
				</div><!--/span-->
	  
				{checkActionsTpl location="tpl_pligg_columns_start"}	
				
				{if $pagename neq "submit" && $pagename neq "user" && $pagename neq "profile" && $pagename neq "user_edit" && $pagename neq "register" && $pagename neq "login"}
					<!-- START RIGHT COLUMN -->
					<div class="col-md-3">
						<div class="panel panel-default">
							<div id="rightcol" class="panel-body">
								<!-- START FIRST SIDEBAR -->
									{include file=$tpl_first_sidebar.".tpl"}
								<!-- END FIRST SIDEBAR -->
								<!-- START SECOND SIDEBAR -->
									{include file=$tpl_second_sidebar.".tpl"}
								<!-- END SECOND SIDEBAR -->
							</div>
						</div><!--/.panel -->
					</div><!--/span-->
					<!-- END RIGHT COLUMN -->
				{/if}
			{checkActionsTpl location="tpl_pligg_banner_bottom"}
			</div><!--/.row-->
		</section><!--/#maincontent-->
		{if $Auto_scroll != '2'}
			<hr>
			<footer class="footer">
				<!-- START FOOTER -->
					{include file=$tpl_footer.".tpl"}
				<!-- END FOOTER -->
			</footer>
		{/if}
		
	</div><!--/.container-->
	
	<!-- START COMMON JAVASCRIPT FUNCTIONS -->
	{include file=$the_template"/functions/common.tpl"}
	<!-- END COMMON JAVASCRIPT FUNCTIONS -->
	
	{if $Voting_Method == 2}
		<!-- START STAR VOTING JAVASCRIPT -->
		{include file=$the_template"/functions/vote_star.tpl"}
		<!-- END STAR VOTING JAVASCRIPT -->
	{else}
		<!-- START UP/DOWN VOTING JAVASCRIPT -->
			{include file=$the_template"/functions/vote_normal.tpl"}
		<!-- END UP/DOWN VOTING JAVASCRIPT -->
	{/if}
	{if $pagename eq "story" || $pagename eq "user"}
		<!-- START COMMENT VOTING JAVASCRIPT -->
			{include file=$the_template"/functions/vote_comments.tpl"}
		<!-- START COMMENT VOTING JAVASCRIPT -->
	{/if}

	{if $anonymous_vote eq "false" and $user_logged_in eq ""}
		<!-- START MODAL LOGIN FORM -->
			{include file=$the_template"/modal_login_form.tpl"}
		<!-- END MODAL LOGIN FORM -->
	{elseif $votes_per_ip>0 and $user_logged_in eq ""}
		<!-- START MODAL LOGIN FORM -->
			{include file=$the_template"/modal_login_form.tpl"}
		<!-- END MODAL LOGIN FORM -->
	{/if}
	
	{include file=$the_template"/functions/bookmark.tpl"}
	{checkActionsTpl location="tpl_pligg_body_end"}
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/smoothness/jquery-ui.css" media="all" rel="stylesheet" type="text/css" />
	
	<!--[if lt IE 7]>
	<script type="text/javascript" src="{$my_pligg_base}/templates/{$the_template}/js/jquery/jquery.dropdown.js"></script>
	<![endif]-->
	
	<script type="text/javascript" src="{$my_pligg_base}/templates/{$the_template}/js/registration_verify.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="{$my_pligg_base}/templates/{$the_template}/js/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="{$my_pligg_base}/templates/{$the_template}/js/jquery/jquery.pnotify.js"></script>
	<script type="text/javascript" src="{$my_pligg_base}/templates/{$the_template}/js/jquery/jquery.masonry.min.js"></script>
	
    {if $pagename eq "topusers"}
		<script type="text/javascript" src="{$my_pligg_base}/templates/{$the_template}/js/jquery.tablesorter.js"></script>
		{literal}
			<script type="text/javascript">
				$(function() {	
					$("#tablesorter-demo").tablesorter({sortList:[[0,0]], widgets: ['zebra']});
					$("#options").tablesorter({sortList: [[0,0]], headers: { 3:{sorter: false}, 1:{sorter: false}}});
				});	
			</script>
		{/literal}
    {/if}
	
	{if $pagename neq 'register'}
		<!-- Register Modal -->
		<div class="modal fade" id="registerModal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">{#PLIGG_Visual_Register#}</h4>
					</div>
					<form action="{$URL_register}" method="post" id="thisform">
						<div class="modal-body">
							<div class="control-group">
								{checkActionsTpl location="tpl_pligg_register_start"}
								
								<label class="control-label" for="input01">{#PLIGG_Visual_Register_Username#}</label>
								<div class="controls">
									<input type="text" class="form-control reg_username" name="reg_username">
									<br/><span class="reg_usernamecheckitvalue"></span><br/>
								</div>
								<label class="control-label" for="input01">{#PLIGG_Visual_Register_Email#}</label>
								<div class="controls">
									{if isset($form_email_error)}
										{ foreach value=error from=$form_email_error }
											<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close">&times;</button>{$error}</div>
										{ /foreach }
									{/if}
									<input type="text" class="form-control reg_email" id="reg_email" placeholder="" name="reg_email">
									<br/><span class="reg_emailcheckitvalue"></span><br/>
								</div>
								<label class="control-label" for="input01">{#PLIGG_Visual_Register_Password#}</label>
								<div class="controls">
									{if isset($form_password_error)}
										{ foreach value=error from=$form_password_error }
											<div class="alert alert-block alert-danger fade in"><button data-dismiss="alert" class="close">&times;</button>{$error}</div>
										{ /foreach }
									{/if}
									<input type="password" class="form-control" id="reg_password" name="reg_password" placeholder="{if isset($reg_password)}{$reg_password}{/if}">
									<p class="help-block">{#PLIGG_Visual_Register_FiveChar#}</p>
								</div>
								<label class="control-label" for="input01">{#PLIGG_Visual_Register_Verify_Password#}</label>
								<div class="controls">
									<input type="password" class="form-control" id="reg_verify" name="reg_password2" placeholder="{if isset($reg_password2)}{$reg_password2}{/if}">
								</div>
								
								{if isset($register_step_1_extra)}
									{if $captcha_method eq "solvemedia"}
										<br />
										{$register_step_1_extra}
									{elseif $captcha_method eq "reCaptcha"}
										{$register_step_1_extra}
									{elseif $captcha_method eq "WhiteHat"}
										<label class="control-label" for="input01">CAPTCHA</label>
										<div class="controls">{$register_step_1_extra}</div>
									{elseif $captcha_method eq "math"}
										<div class="controls">{$register_step_1_extra}</div> 
									{/if}
								{/if}
								 
							</div>
							{checkActionsTpl location="tpl_pligg_register_end"}
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</form>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	{/if}
	
	{if $user_authenticated neq true}
		<!-- Login Modal -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">{#PLIGG_Visual_Login_Title#}</h4>
					</div>
					<div class="modal-body">
						<div class="control-group">
							<form id="signin" action="{$URL_login}" method="post">
								{checkActionsTpl location="tpl_pligg_login_link"}
								<div style="login_modal_username">
									<label for="username">{#PLIGG_Visual_Login_Username#}/{#PLIGG_Visual_Register_Email#}</label>
									<input id="username" name="username" class="form-control" value="{if isset($login_username)}{$login_username}{/if}" title="username" tabindex="1" type="text">
								</div>
								<div class="login_modal_password">
									<label for="password">{#PLIGG_Visual_Login_Password#}</label>
									<input id="password" name="password" class="form-control" value="" title="password" tabindex="2" type="password">
								</div>
								<div class="login_modal_remember">
									<div class="login_modal_remember_checkbox">
										<input id="remember" style="float:left;margin-right:5px;" name="persistent" value="1" tabindex="3" type="checkbox">
									</div>
									<div class="login_modal_remember_label">
										<label for="remember" style="">{#PLIGG_Visual_Login_Remember#}</label>
									</div>
									<div style="clear:both;"></div>
								</div>
								<div class="login_modal_login">
									<input type="hidden" name="processlogin" value="1"/>
									<input type="hidden" name="return" value="{$get.return}"/>
									<input class="btn btn-primary col-md-12" id="signin_submit" value="{#PLIGG_Visual_Login_LoginButton#}" tabindex="4" type="submit">
								</div>
								<hr class="soften" id="login_modal_spacer" />
								<div class="login_modal_forgot">
									<a class="btn btn-default col-md-12" id="forgot_password_link" href="{$URL_login}">{#PLIGG_Visual_Login_ForgottenPassword#}?</a>
								</div>
							</form>
						</div>

					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	{/if}

	{if $pagename eq 'index' or $pagename eq 'published' or $pagename eq 'new' or $pagename eq 'group_story' or $pagename eq 'user'}
		<!-- START ARTICLES PAGINATION JAVASCRIPT -->
			{include file=$the_template"/functions/articles_pagination.tpl"}
		<!-- END ARTICLES PAGINATION JAVASCRIPT -->
	{/if}
	
	{if $pagename eq 'topusers'}
		<!-- START TOPUSERS PAGINATION JAVASCRIPT -->
			{include file=$the_template"/functions/topusers_pagination.tpl"}
		<!-- END TOPUSERS PAGINATION JAVASCRIPT -->
	{/if}
	
	{if $pagename eq 'groups'}
		<!-- START GROUPS PAGINATION JAVASCRIPT -->
			{include file=$the_template"/functions/groups_pagination.tpl"}
		<!-- END GROUPS PAGINATION JAVASCRIPT -->
	{/if}
	
	{if $pagename eq 'search'}
		<!-- START SEARCH PAGINATION JAVASCRIPT -->
			{include file=$the_template"/functions/search_pagination.tpl"}
		<!-- END SEARCH PAGINATION JAVASCRIPT -->
	{/if}
	
	{literal}
		<script> 
		$('.avatar-tooltip').tooltip()
		</script>
	{/literal}

	{if $pagename eq "profile"}
		{* Masonry JavaScript *}
		{literal}
			<script>
			var container = document.querySelector('#profile_container');
			var msnry = new Masonry( container, {
			  // options
			  columnWidth: 200,
			  itemSelector: '.masonry_wrapper'
			});
			</script>
		{/literal}
	{/if}
</body>
</html>
{/if}{*END Maintenance Mode *}