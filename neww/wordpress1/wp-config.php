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
# define( 'DB_HOST', '192.168.99.100:3306' );

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
define( 'AUTH_KEY',         'RpPP5>|~^fN.*ahB,IJ,Ln }p2}|~_a[jeLbeU%]DV<K?PA(`F[n:5w|=|b<~WuK' );
define( 'SECURE_AUTH_KEY',  'H9XmJ<Gd66<Tu<y.#svwkb(Rup,*GQv2l#bOjawMC3{LM-=7{so91AG}`DVpvQoc' );
define( 'LOGGED_IN_KEY',    '1?H2.?G2#[K(blg .vT(@xT- 8b]NR$*L[jUUJMBCgbc-PW*r6YyOR#oH?J]a}0C' );
define( 'NONCE_KEY',        'IRS9f![YNyf:D;ZC`ElC`AS0-jo&%+h3xy6jTr,Z8)7xbs%<rSizxAoI_DXH^9J5' );
define( 'AUTH_SALT',        'TmO+L|1^]Z Q0n2U{?9aIa}jvXZCu#?)J+/vEs0+1mh#n]GPE;ua)Au!W56jf;FC' );
define( 'SECURE_AUTH_SALT', 'SZu&0ouJr^?>FKh$N|x%=78thECw;SZyLe5Dx%p&yt{+8]k% a9xhmd>+]V2pGj+' );
define( 'LOGGED_IN_SALT',   'E<llQ?WaP`~*;Vj]#5qnv_KM(XIBl=v2Y8,p[vl BZW`O(Y&#,H,V#g;%U;_7u;p' );
define( 'NONCE_SALT',       '$7&aw>9lVD2oPWwGpwN?m:xzuj>%RJc 5dBpF3x|Gas>;FyFVcFeD(F3C2MiVGw0' );

/**#@-*/


/** MySQL hostname */
define( 'DB_HOST',			'mysql-svc:3306' );
define( 'WP_HOME',			'http://192.168.99.102:5050/' ); # EXTERNAL IP
define( 'WP_SITEURL',		'http://192.168.99.102:5050/' ); # EXTERNAL IP

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
