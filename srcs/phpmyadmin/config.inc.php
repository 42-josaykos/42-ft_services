<?php

declare(strict_types=1);

$cfg['blowfish_secret'] = 'ZK:w0XQHvRXJmTjP;=-}1:XPTSp]d:w0';

/* Servers configuration */
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = 'admin';
$cfg['Servers'][$i]['password'] = 'admin';

/* Directories for saving/loading files from server */
$cfg['UploadDir'] = '';
$cfg['PmaAbsoluteUri'] = '172.17.0.3:5000';
$cfg['SaveDir'] = '';

$cfg['TempDir'] = 'tmp';
