package js.nw;

/** Represents information about an HTTP cookie. **/
typedef Cookie = {

	/** The cookie domain. **/
	domain: String,

	/** The expiration date of the cookie as the number of seconds since the UNIX epoch. **/
	?expirationDate: Float,

	/** Value indicating whether the cookie is a host-only cookie. **/
	hostOnly: Bool,

	/** Value indicating whether the cookie is marked as `HttpOnly`. **/
	httpOnly: Bool,

	/** The cookie name. **/
	name: String,

	/** The cookie path. **/
	path: String,

	/** The cookie's same-site status. **/
	sameSite: SameSiteStatus,

	/** Value indicating whether the cookie is marked as `Secure`. **/
	secure: Bool,

	/** Value indicating whether the cookie is a session cookie. **/
	session: Bool,

	/** The cookie value. **/
	value: String
}

/** Provides information about a cookie's change. **/
typedef CookieChange = {

	/** The underlying reason behind the cookie's change. **/
	cause: OnChangedCause,

	/** Information about the cookie that was set or removed. **/
	cookie: Cookie,

	/** Value indicating whether the cookie was removed. **/
	removed: Bool
}

/** A collection of the available cookies. **/
extern class Cookies {

	/** The event fired when a cookie is set or removed. **/
	final onChanged: {
		function addListener(listener: CookieChange -> Void): Void;
		function removeListener(listener: CookieChange -> Void): Void;
	};

	/** Retrieves information about a single cookie. **/
	function get(details: {name: String, url: String}, callback: ?Cookie -> Void): Void;

	/** Retrieves all cookies that match the given information. **/
	function getAll(details: {
		?domain: String,
		?name: String,
		?path: String,
		?secure: Bool,
		?session: Bool,
		?url: String
	}, callback: Array<Cookie> -> Void): Void;

	/** Deletes a cookie by name. **/
	function remove(details: {name: String, url: String}, callback: ?{name: String, url: String} -> Void): Void;

	/** Sets a cookie with the given cookie data. **/
	function set(details: {
		url: String,
		?domain: String,
		?expirationDate: Float,
		?httpOnly: Bool,
		?name: String,
		?path: String,
		?sameSite: SameSiteStatus,
		?secure: Bool,
		?value: String
	}, callback: ?Cookie -> Void): Void;
}

/** Defines the underlying reason behind a cookie change. **/
enum abstract OnChangedCause(String) to String {

	/** The cookie was automatically removed due to garbage collection. **/
	var Evicted = "evicted";

	/** The cookie was automatically removed due to expiry. **/
	var Expired = "expired";

	/** The cookie was removed due to being overwritten with an already-expired expiration date. **/
	var ExpiredOverwrite = "expired_overwrite";

	/** The cookie was inserted, or removed via an explicit call to `remove`. **/
	var Explicit = "explicit";

	/** The cookie was automatically removed due to a `set` call that overwrote it. **/
	var Overwrite = "overwrite";
}

/** Defines the state of a cookie's `SameSite` attribute. **/
enum abstract SameSiteStatus(String) to String {

	/** The cookie is set with `SameSite=Lax`. **/
	var Lax = "lax";

	/** The cookie is set with `SameSite=None`. **/
	var NoRestriction = "no_restriction";

	/** The cookie is set with `SameSite=Strict`. **/
	var Strict = "strict";

	/** The cookie is set without the `SameSite` attribute. **/
	var Unspecified = "unspecified";
}
