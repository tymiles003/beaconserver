<?php
require_once 'Zend/Config/Ini.php';
require_once 'Zend/Db.php';

class DB
{
    const TABLE_NAME_USER           =   'user';
    const TABLE_NAME_USERMETA       =   'usermeta';
    const TABLE_NAME_BEACON         =   'beacon';
    const TABLE_NAME_PROMOTION      =   'promotion';
    const TABLE_NAME_PLAN           =   'plan';
    
    public function __construct()
    {
        try{
        $config = new Zend_Config_Ini(APPLICATION_PATH.'/configs/application.ini', 'database');
        $_db = Zend_db::factory($config);
        Zend_Db_Table::setDefaultAdapter($_db);
            $_db->query("SET NAMES 'utf8'");
        }catch (Zend_Exception $e){
            die($e->getMessage());
        }
    }

    public function insert($tablename, $param)
    {
        return $_db->insert($tablename, $param);
    }

    public function query($sql)
    {
        return $_db->query($sql).fetchAll();
    }

    public function update($tablename, $param, $where)
    {
        return $_db->update($tablename, $param, $where);
    }

    public function delete($tablename, $where)
    {
        return $_db->delete($tablename, $where);
    }

    private $_db;
}
