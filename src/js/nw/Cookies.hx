package js.nw;

/** Represents information about an HTTP cookie. **/
extern class Cookie {
	// TODO
}

/** TODO **/
extern class Cookies {

	/** An event fired when a cookie is set or removed. **/
	final onChanged: {
		addListener: () -> Void,
		removeListener: () -> Void
	};
}

/** TODO **/
typedef OnChangedCallback = () -> Void;

/** Defines the underlying reason behind a cookie change. **/
enum abstract OnChangedCause(String) from String to String {

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
enum abstract SameSiteStatus(String) from String to String {

	/** The cookie is set with `SameSite=Lax`. **/
	var Lax = "lax";

	/** The cookie is set with `SameSite=None`. **/
	var NoRestriction = "no_restriction";

	/** The cookie is set with `SameSite=Strict`. **/
	var Strict = "strict";

	/** The cookie is set without the `SameSite` attribute. **/
	var Unspecified = "unspecified";
}
