<?php

class Model {
	public $db;
	public $dbhost = "127.0.0.1";
	public $dbname = "mysql";
	public $dbuser = "mysql";
	public $dbpass = "mysql";

	function __construct () {
		$this->db = new mysqli($this->dbhost, $this->dbuser, $this->dbpass, $this->dbname);
		if ($this->db->connect_errno) die("Не удалось подключиться к MySQL: {$this->db->connect_errno} {$this->db->connect_error}");
	}

	function print ($text) {
		static $print;
		if ($print == true) echo "<hr> {$text}";
		else {
			$print = true;
			echo $text;
		}
	}
}
