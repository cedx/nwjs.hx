package js.nw;

/** Represents information about an HTTP cookie. **/
typedef Cookie = {

	/** The cookie domain. **/
	var domain: String;

	/** The expiration date of the cookie as the number of seconds since the UNIX epoch. **/
	var ?expirationDate: Float;

	/** Value indicating whether the cookie is a host-only cookie. **/
	var hostOnly: Bool;

	/** Value indicating whether the cookie is marked as `HttpOnly`. **/
	var httpOnly: Bool;

	/** The cookie name. **/
	var name: String;

	/** The cookie path. **/
	var path: String;

	/** The cookie's same-site status. **/
	var sameSite: SameSiteStatus;

	/** Value indicating whether the cookie is marked as `Secure`. **/
	var secure: Bool;

	/** Value indicating whether the cookie is a session cookie. **/
	var session: Bool;

	/** The cookie value. **/
	var value: String;
}

/** Provides information about a cookie's change. **/
typedef CookieChange = {

	/** The underlying reason behind the cookie's change. **/
	var cause: OnChangedCause;

	/** Information about the cookie that was set or removed. **/
	var cookie: Cookie;

	/** Value indicating whether the cookie was removed. **/
	var removed: Bool;
}

/** A collection of the available cookies. **/
extern class Cookies {

	/** The event fired when a cookie is set or removed. **/
	final onChanged: OnChangedEvent;

	/** Retrieves information about a single cookie. **/
	function get(details: Dynamic, callback: Cookie -> Void): Void;

	/** Retrieves all cookies that match the given information. **/
	function getAll(details: Dynamic, callback: Array<Cookie> -> Void): Void;

	/** Deletes a cookie by name. **/
	function remove(details: Dynamic, callback: Dynamic -> Void): Void;

	/** Sets a cookie with the given cookie data. **/
	function set(details: Dynamic, callback: Cookie -> Void): Void;
}

/** Defines the underlying reason behind a cookie change. **/
enum abstract OnChangedCause(String) {

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

/** An event fired when a cookie is set or removed. **/
typedef OnChangedEvent = {

	/** Adds a `listener` that will be invoked when this event is triggered. **/
	function addListener(listener: CookieChange -> Void): Void;

	/** Removes the specified `listener` for this event. **/
	function removeListener(listener: CookieChange -> Void): Void;
}

/** Defines the state of a cookie's `SameSite` attribute. **/
enum abstract SameSiteStatus(String) {

	/** The cookie is set with `SameSite=Lax`. **/
	var Lax = "lax";

	/** The cookie is set with `SameSite=None`. **/
	var NoRestriction = "no_restriction";

	/** The cookie is set with `SameSite=Strict`. **/
	var Strict = "strict";

	/** The cookie is set without the `SameSite` attribute. **/
	var Unspecified = "unspecified";
}
