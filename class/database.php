<?php
/**
 * データベース接続クラス
 * @author Deflis
 */
require_once 'Zend/Db.php';

class database {

    private $_database;

    /**
     * データベース接続クラスを初期化します。
     * @param string $dsn DSN
     * @param string $username ユーザー名
     * @param string $password パスワード
     */
    public function __construct($adapter, $config = array()) {
        try {
            $this->_database = Zend_Db::factory($adapter, $config);
        } catch (Exception $e) {
            throw $e;
        }
    }

    /**
     * クエリを発行します。
     * @param String $sql SQLクエリ文
     * @return Zend_Db_Statement_Interface 実行結果
     */
    public function query($sql) {
        try {
            $ret = $this->_database->query($sql);
        } catch (Exception $e) {
            throw $e;
        }
        return $ret;
    }

    /**
     * ユーザーテーブルを取得
     * @return Zend_Db_Select
     */
    public function getUsers() {
        return $this->_database->select()->from('users');
    }

    /**
     * 書籍テーブルを取得
     * @return Zend_Db_Select
     */
    public function getBooks() {
        return $this->_database->select()->from('books');
    }

    /**
     * 書架テーブルを取得
     * @return Zend_Db_Select
     */
    public function getBookShelves() {
        return $this->_database->select()->from('users_books');
    }
}

?>
