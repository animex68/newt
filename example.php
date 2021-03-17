<?php

require_once(__DIR__ . "/conf.php");
require_once(__DIR__ . "/Blacklists.php");
$Blacklists = new Blacklists;
$Blacklists->save("p1, s1, p333", 1);
$Blacklists->print($Blacklists->get(2));
