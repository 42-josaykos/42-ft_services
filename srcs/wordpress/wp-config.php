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
define( 'AUTH_KEY',         '%){3)qMh=`QiFc54T8Yy{mhY$(3xjy8q#%%zq83?e8^&tQMC5{Y=:QIMU:@oCoK9' );
define( 'SECURE_AUTH_KEY',  'QgdTT7&Gi0>W]{:^IO+G5_;TZ,DqE@^>,jeWlz{~m08cxH^STO2o@!3fK{!FK58G' );
define( 'LOGGED_IN_KEY',    '/V$$oOR+cCwj9sKx~u.+OM07~K;]LiYafk*Gte?1mn[s.j6Ib2k&NptuBApT>Y7a' );
define( 'NONCE_KEY',        '9~mBB(Gr?f0|ZD S`1pg#~/L#z:Z3xLRh!60DQ<I6Dp8NqxIy^$<YGy(W|KF<uT;' );
define( 'AUTH_SALT',        '(914OYvY_EMa23nmQm$xr-+[vTGQ4ia}O)}y8:d@&;D%wrhlHa<6DO[iTOm0K1T>' );
define( 'SECURE_AUTH_SALT', 'E/QYpm&$o$Qn;}9E0JZk)^R?*XzXC_t3.ll`Y<>0=`^wdz9]m]u_ Yn%S4MS)CY5' );
define( 'LOGGED_IN_SALT',   ';HybQ:)4~10& 8%O>lm).C>H9*_yS19?<w9,Rfk2+[yxvo}V2-sO@fS=L:Dp<#&D' );
define( 'NONCE_SALT',       '<8wZ]k?F_yn`XA)-3?4B<&rq~~](d5zKcHGqLuW}N0+EiHOcg2acA{,M-bQ.;kI ' );

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

