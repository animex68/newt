<?php

class Blacklists extends Model {
	function get ($advertisers_id) {
		if (!$this->checkAdvertisersById($advertisers_id)) {
			$this->print("Рекламодателя с идентификатором {$advertisers_id} не существует");
			return false;
		}

		if ($result = $this->db->query("SELECT table_name, value_id FROM blacklists WHERE advertisers_id = '" . (int) $advertisers_id . "' ORDER BY id ASC")) {
			while ($obj = $result->fetch_object()) {
				if (!isset($list)) {
					$list = $obj->table_name.$obj->value_id;
				} else {
					$list .= ", ". $obj->table_name.$obj->value_id;
				}
			}
			return isset($list) ? $list : "";
		} else {
			return false;
		}
	}

	function save ($list, $advertisers_id) {
		if (!preg_match("/^(?:\s?\w\d\,?)+$/i", $list)) {
			$this->print("Неверный формат ввода строки");
			return false;
		}

		if (!$this->checkAdvertisersById($advertisers_id)) {
			$this->print("Рекламодателя с идентификатором {$advertisers_id} не существует");
			return false;
		}

		$list = explode(",", $list);
		foreach ($list as $key => $value) {
			$value = trim($value);
			$id = (int) preg_replace("/[^0-9]/", "", $value);
			if (($value[0] == "s" || $value[0] == "p") && is_int($id)) {
				$table = $value[0] == "s" ? "sites" : "publishers";
				if ($this->db->query("SELECT id FROM {$table} WHERE id = {$id}")->num_rows > 0) {
					if (!$this->add($table, $id, $advertisers_id)) {
						$this->print("Ошибка добавления {$value}: {$this->db->error}");
					}
				} else {
					$this->print("В таблице {$table} не найден ID {$id}, строка {$value}");
				}
			} else {
				$this->print("Ошибка заполнения строки {$value}");
			}
		}

		return true;
	}

	function checkAdvertisersById ($advertisers_id) {
		if ($this->db->query("SELECT id FROM advertisers WHERE id = ". (int) $advertisers_id ."")->num_rows > 0) {
			return true;
		} else {
			return false;
		}
	}

	function add ($table, $id, $advertisers_id) {
		if ($this->db->query("INSERT INTO blacklists (advertisers_id, table_name, value_id) VALUES ('" . (int) $advertisers_id . "', '" . $table[0] . "', '" . (int) $id . "')")) {
			return $this->db->insert_id;
		} else return false;
	}

	function __construct () {
		parent::__construct();
	}
}
