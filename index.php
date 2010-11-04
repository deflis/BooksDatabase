<?php
require_once './config.inc.php';
$database = new database($db_adapter, $db_config);
$smarty = new SetupSmarty($app_name, $template_dir, $compile_dir, $config_dir, $cache_dir);

// データベースでごにょごにょ
$users = $database->getUsers()->query()->fetchAll();

// テンプレートで出力
$smarty->assign('Users', $users);
$smarty->assign('name', '名前');
$smarty->display('./template/template.tpl');
?>

