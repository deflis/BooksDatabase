<?php

$app_name       = "";
$template_dir   = "./templates";
$compile_dir    = "./templates_c";
$config_dir     = "./config";
$cache_dir      = "./cache";

$db_adapter     = 'Mysqli';
$db_config      = array(
                    'host'     => 'localhost',
                    'username' => 'bookdb',
                    'password' => 'bookdb',
                    'dbname'   => 'bookdb',
                    'charset'       => 'utf8'
);

require_once './class/database.php';
require_once './class/smarty.php';
require_once 'Services/Amazon.php';
require_once 'amazon.inc.php';
?>