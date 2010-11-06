<?php
require_once './smarty/Smarty.class.php';
/**
 * Smarty setup class
 *
 * @author Deflis
 */
class SetupSmarty extends Smarty {
   function  __construct($app_name, $template_dir, $compile_dir, $config_dir, $cache_dir, $caching = false) {
        parent::__construct();

        $this->template_dir = $template_dir;
        $this->compile_dir  = $compile_dir;
        $this->config_dir   = $config_dir;
        $this->cache_dir    = $cache_dir;

        $this->caching = $caching;
        $this->assign('app_name', $app_name);
   }
}
?>
