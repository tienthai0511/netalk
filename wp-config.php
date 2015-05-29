<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'entalk');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '36{N^OOADcNEw,1g^y~2?dE|T,tM0@b$y:mbBG{HG,uS4;3e+K_G1.v^(`^5HkYb');
define('SECURE_AUTH_KEY',  'w1A|![4F;/p&]v}+Hg|Z9(/L`f!usT{Y;7^e5*<H5o!%r<lj=<jXy~@|<NvEwYG~');
define('LOGGED_IN_KEY',    ')3Qwz]0tZw/-L.)aW0,p/0B_>W!#(Ux;:hOVE03;o_Q)mBcf7i$7fIJ_)G(!-S2c');
define('NONCE_KEY',        'S+{1[45<b+-)%Hzq[vRNO3UciwXlA)9e}+p&&V7lVBGwBhvQ+MM^kB~sT?r8q?t0');
define('AUTH_SALT',        'oMx~|xL/4V}-nT+T+kB~=fEe2JnNRp-l+OyX+||w2G!5(rOQ|lbh &,i 6h]tY*H');
define('SECURE_AUTH_SALT', 'w9vpol|BQquqT!+Z9fe$cjqtra=MpIePT6<gg)mSbF9g/Zz]m LgVF|6f> >K6t;');
define('LOGGED_IN_SALT',   ' 0Ty,5ka-Ixb|K-(=jNj8~o.XQ[?V63ZY#_z4|X|:zP:#_}WA`s7I-A%K`]#HDom');
define('NONCE_SALT',       '?|d LgqV{6@1MaS/WF_TW].#3Uy^E87~m9R}Y7&}+  (`K<]X[!|;+}[l~KNDd0q');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'talk';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
