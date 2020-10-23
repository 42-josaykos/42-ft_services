<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Dx/4ni!~;*xx)92#50^s[4G H8o/_{uZuo0RK?^LOK]*V,iS+vWY{Cv.+gV<NV72' );
define( 'SECURE_AUTH_KEY',  'G9dR`%cJ-qS-I#9@<xD(h;`JAB4phK]hO7/x>Wqg.@kr_pPB;A)[`)FUmW#ubeLR' );
define( 'LOGGED_IN_KEY',    'G/v=@Qdzev@o!m|]Kt!a*cvtErkq0re0+PNO;AvhwTknuzgj(Kt*u6%}EBqd0B7 ' );
define( 'NONCE_KEY',        'r*47BbG!4!4}@iywkwl.D:Si?HdYrPPOS(Wh;<[J3e>%GFU{YwF%2TQSlXDR!!Y-' );
define( 'AUTH_SALT',        'Y1TjcESY&tyNFj:vf|lO?%mL??59Y( :QTay<iF4W.D+{9g1@jpM^6954+DuEnxi' );
define( 'SECURE_AUTH_SALT', 'v8vo}1KZ$5mnU)e_{BIemyg/Vf vR;^^}p}_e@(te.0.TFM ;A)OP?&/W6G<Hih7' );
define( 'LOGGED_IN_SALT',   'WY3*$75S8]H*s%)<PF+~F%q4dK|0]+_BIQzl*dm;ua,kD)+Yq=c!5@9j`w39P*m)' );
define( 'NONCE_SALT',       '6I*,<gqg{ETG[(Kam@Sc`*exf0@]#v23gE-2?8k+5mJ,)_;+tY@hY^M3T1KiZp_m' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

define('FS_METHOD', 'direct');
