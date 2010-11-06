<?php

require_once './config.inc.php';
$database = new database($db_adapter, $db_config);
$smarty = new SetupSmarty($app_name, $template_dir, $compile_dir, $config_dir, $cache_dir);
$amazon = new Services_Amazon($amazon_access_key_id, $amazon_secret_access_key);

// データベースでごにょごにょ
$users = $database->getUsers()->query()->fetchAll();
$books = $database->getBooks()->query()->fetchAll();

$amazon->setLocale('JP');
$amazon_options = array(
    'IdType' => 'ASIN',
    'ResponseGroup' => 'Images,ItemAttributes'
    );

foreach ($books as &$book) {
    $isbn = $book['isbn'];
    if (mb_strlen($isbn) == 13) {
        // 頭の978とチェックデジットの除去
        $isbn = mb_strcut($isbn, 3, 9);
        // 一桁ごとの配列に変換
        $wk = str_split($isbn, 1);
        // チェックディジット計算用
        $check = 0;
        for ($i = 0; $i < 9; $i++) {
            $check += $wk[$i] * (10 - $i);
        }
        // 総和を10で割ったものを10から引き、10の場合はXにする
        $check = (11 - ($check % 11)) % 11;
        if ($check == 10) {
            $check = 'X';
        }
        $isbn .= $check;
    }
    $ret = $amazon->ItemLookup($isbn, $amazon_options);
    $book['amazon'] = $ret['Item'][0];

//    var_dump($book['amazon']);
}
// テンプレートで出力
$smarty->assign('Users', $users);
$smarty->assign('Books', $books);
$smarty->assign('name', '名前');
$smarty->display('./templates/template.tpl');
?>
