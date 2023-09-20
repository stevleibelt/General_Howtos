# HTTP Headers

## General information

* Can be grouped according to their context
  * General headers
	* Additional information about request/response
	* Can be used for request and response
	* Do not apply for the content itself
  * Request headers
	* Additional information about the request
	* Do not relate to the content of the message
  * Response headers
	* Additional information about the response
	* Do not relate to the content of the message
  * Entity headers
	* Contain information about the body of resource
	* Used to describe the content of the message

## Categories of HTTP headers

* Authentication
  * Www-authentication
    * Defines the authentication method used to access a ressource
  * Authorization
    * Contains the credentials to authenticate a user-agent with a server
* Caching
  * Age
    * Time in seconds that an object has been in a proxy cache
  * Cache-control
    * Directives for caching mechanisms in both requests/response
  * Expires
    * Date/time after which the response is considered stale
* Client Hints
* Conditionals
  * Last-modified
    * Last modification date of the resource
  * ETag
    * Unique string identifying the version of the resource
  * If-Match
    * Makes the request conditional on matching one of the ETags
  * If-None-Match
    * Makes the request conditional and only applies if the stored resource do not match any of the provided ETags
  * If-Modified-Since
    * Makes the request conditional, expects entity to be transmitted only if it has beend modified after the given date
  * If-Unmodified-Since
    * Makes the request conditional, expects entity to be transmitted only if it has not beend modified after the given date
* Connection management
  * Connection
    * Indicates if the network connection stays open after the current transaction finished (i.e. keep-alive)
  * Keep-Alive
    * Indicates how long the persistent connection should stay open
* Content negotiation
  * Accept
    * Informs the server about types of data that can be sent back
  * Accept-Charset
    * Informs the server about character encodings the client understands
  * Accept-Encoding
    * Informs the server about encodings (compression algorithms) the client understands
  * Accept-Language
    * Informs the server about the language expected to send back
* Controls
* Cookies
  * Cookies
    * Contains stored cookies previously sent by the server with Set-Cookie
  * Set-Cookie
    * Sends cookies form the server to the user-agent
* CORS
  * Cross-Origin Resource Sharing
* Do not track
* Downloads
* Message body information
  * Content-Lenght
    * The size of the content, expressed as decimal number in bytes
  * Content-Type
    * Indicates the type of the media in the ressource
  * Content-Language
    * Describes the natural language of the content
  * Content-Location
    * Describes an alternate location for the data
* Proxis
* Redirects
  * Location
    * Indicates the url to redirect a page to (30X)
* Request context
  * From
    * Contains an email address of the human user controlling the requesting user agent
  * Host
    * Specifies the domain name of the server (for virtual hosting) and optionally the tcp port
* Response context
  * Allow
    * List of HTTP request methods supported by the resource
  * Server
    * Contains informaton about the software used by the origin server to handle the request
* Range request
* Security
* Server-sent events
* Transfer coding
* Websockets
* Other
  * Date
    * The date and time when the message was originated
  * SourceMap
    * Links generated code to a source map, enabling the browser to reconstruct the original source and present the reconstructed original in the debugger

## Security headers

* There are two types of security headers
  * Headers that weaken security
    * CORS
      * Allows a server to indicate originst (domain, scheme, port) other than its own from which a browser should permit loading ressources
      * [CORS: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) - 20230912
  * Headers that are strengthen security
    * Content-Security-Policy (CSP)
      * Is build to be backward compatible
      * Build as successor of `same-origin policy`
      * Can be tested by defining the policy but replace `Content-Security-Policy` with `Content-Security-Policy-Report-Only`
        * All bad things are than logged in the console of the webbrowser
      * Can be configured
        * as `Content-Security-Policy: policy`
        * or as `<meta http-equiv="Content-Security-Policy"\ncontent="default-src 'self'; img-src https://*; child-src 'none';" />`
      * "Does not fix an underlying issue" but could block exploitation
      * [CSP: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP) - 20230912
      * [csp Evaluator: withgoogle.com](https://csp-evaluator.withgoogle.com/) - 20230912
    * HSTS
      * Also know as `HTTP Strict-Transport-Security`
      * Informs the browser if a resource is only available via HTTPS
      * Is only used by the browser if your resource cannot be accessed by http and https contains a certificate without errors
      * [HSTS: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security) - 20230912
    * HTTPOnly Cookie
      * [HTTP cookies: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies) - 20230912
    * X-Frame-Options
      * `X-Frame-Options: DENY`
        * This page can not be displayed in a frame, regardless of the site attemptint to do so
      * `X-Frame-Options: SAMEORIGIN`
        * The page can only be displayed if all anecestor frames are same origin to the page itself
      * [X-Frame-Options: mozialla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options) - 20230912

### TL;DR

Based on the gained knowledge and [OWASP recommendations](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html), this is the recommendation area.

* `Strict-Transport-Security: max-age=31536000`
* `Content-Security-Policy: default-src 'self'; child-src 'self'; base-uri 'self'; navigate-to 'self'; frame-ancestors 'none'`
* `X-Frame-Options: DENY`
* `X-Content-Type-Options: nosniff`
* `Referrer-Policy: strict-origin-when-cross-origin`
* `Permissions-Policy: geolocation=(), camera=(), microphone=()`
* `Cross-Origin-Embedder-Policy: require-corp`
* `Cross-Origin-Opener-Policy: same-origin`
* `Cross-Origin-Resource-Policy: same-site`

### Strict-Transport-Security

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security) - 202300915

* Also know as [HSTS](https://developer.mozilla.org/en-US/docs/Glossary/HSTS)
* Informs the client that this ressource should only be accessed using HTTPS
* This is more secure than a 301 forward from HTTP to HTTPS
  * By doing the initial HTTP Request, the client could have sent confidential data
  * A 301 forward could lead to a man-in-the-middle-attack
* The Syntax is `Strict-Transport-Security: max-age=<expire-time>[; includeSubDomains[; preload]]`
  * `max-age`: time in seconds the client should remember this directive - should match your certificate lifetime (less than that)
  * `includeSubDomains`: are subdomains covered as well?
  * `preload`: Can only be used if `max-age` is set to `>= 31536000` (one year) and if `includeSubDomains` is used
    * If this is enabled, the browser is using a [google HSTS preload service](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security#preloading_strict_transport_security)
    * This is no official part of the HSTS specification

### Content-Security-Policy

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) - 202300915

* Helps guard against [cross-site scripting](https://developer.mozilla.org/en-US/docs/Glossary/Cross-site_scripting) attacks
* Enables to control which resources are allowed to load
  * Should/Can be configured per ressource
* The Syntax is `Content-Security-Policy: <policy-directive>[; <policy-directive>[; ...]]`
  * Fetch directives
    * Control the locations from which certain resource types may be loaded
    * `child-src`
      * Used for [web workers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/child-src)
      * Defines the valid source for loading elements such as `<frame>` or `<iframe>`
      * Not needed since we don't want to allow usage of embedding this page in general
    * `connect-src`: [Restricts the URLs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/connect-src) which can be loaded using the script interface
    * `default-src`
      * Acts as [fallback](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/default-src) for all fetch directives
      * `default-src 'self'`: This line is the same as setting `connect-src`, `font-src`, `frame-src`, `img-src`, `manifest-src`, `object-src`, `script-src`, `style-src` to `self`
	* `prefetch-src`: [No standard](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/prefetch-src)
	* `worker-src`: [Not mandatory](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/worker-src), `child-src`, `script-src` or `default-src` is used
  * Document directives
    * Control the properties of document for worker environment
    * `base-uri`: [Restrics](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/base-uri) URLs which can be used in a document's base element
    * `sandbox`: [If present](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/sandbox), controls what is allowed
  * Navigation directives
    * `form-action`: [Uses](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/form-action) `default-src` as fallback
    * `frame-ancestors`: [If set](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) to `none` it is the same as `X-Frame-Options: deny`
    * `navigate-to`: [Not covered](https://content-security-policy.com/navigate-to/) by `default-src`
  * Reporting directives
    * `report-uri`: [No longer recommended](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/report-uri)
    * `report-to`: Fires a [json field value](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/report-to) - Not covered by all browser

### X-Frame-Options

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options) - 202300915

* The Syntax is `X-Frame-Options: <policy>`
  * `DENY`: Embedding the page in an iframe is forbidden
  * `SAMEORIGIN`: Embedding the page in an iframe is allowed for same origin
  * `ALLOW-FROM <origin>`: Not working in modern browsers anymore, use `Content-Security-Policy: frame-ancestors <...>` instead

### X-Content-Type-Options

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options) - 202300915

* Marker header that indicates that the `Content-Type` headers should be followed and not be changed
* Avoids [MIME type sniffing](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types#mime_sniffing)
* Sould only be used if `Content-type` is provided
* The Syntax is `X-Content-Type-Options: nosniff`

### Referrer-Policy

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy) - 202300915

* Controls how much referrer information should be included with the requests
  * Can be set in [HTML](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy#integration_with_html) too
* The Syntax is `Referrer-Policy: <directives>`
  * `no-referrer`: 
  * `no-referrer-when-downgrade`
  * `origin`
  * `origin-when-cross-origin`
  * `same-origin`
  * `strict-origin`
  * `strict-origin-when-cross-origin`

### Permissions-Policy

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Permissions-Policy) - 202300915

* Controls the use of browser features in a document or withint a iframe
  * This is a complex policy
* The Syntax is `Permissions-Policy: <directive> <allowlist>`
  * [List of directives](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Permissions-Policy#directives)
  * `allowlist`
    * `*`: Allowed in this document and in nested environments
    * `()`: Empty allowlist indicates to disable this feature (do not allow)
    * `self`: Allowed in this document and all nested environments
    * `src`: Allowed in this iframe
    * `<origin>`: Allowed in this special origin


### Cross-Origin-Embedder-Policy

This is an upcomming header.

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Embedder-Policy) - 202300915

* Controls embedding of cross-origin ressource in the document
* Known as COEP
* The Syntax is `Cross-Origin-Embedder-Policy: <directive>`
  * `unsafe-none`: Default value, allows to fetch cross-origin ressources
  * `unsafe-corp`: Ressources can only load from same origin
  * `credentials`: Experimental feature

### Cross-Origin-Opener-Policy

This is an upcomming header.

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Opener-Policy) - 202300915

* Controls if top level document share a browsing context group with cross-origin documents (Works with COEP and CORP)
* Known as COOP
* The Syntax is `Cross-Origin-Opener-Policy: <directive>`
  * `unsafe-none`: Default value, allows to be added to its openers browsing context group
  * `same-origin-allow-popups`: Retains references to newly opened windows or tabs
  * `same-origin`: Isolates the browsing context exclusively to same origin documents

### Cross-Origin-Resource-Policy

This is an upcomming header.

[Source: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Resource-Policy) - 202300915

* Controls that the browser blocks no-cors requests to a given resource
* Known as CORP
* The Syntax is `Cross-Origin-Resource-Policy: <policy>`
  * `same-site`:
  * `same-origin`:

## Links

* [Content Security Policy Level 3: w3.org](https://www.w3.org/TR/CSP3/) - 20230920
* [HTTP Headers: mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers) - 20230915
* [HTTP Security Response Headers Cheat Sheet: owasp.org](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html#referrer-policy) - 20230915
* [Learn in 5 Minutes: HTTP Headers (General/Request/Response/Entity): youtube.com](https://www.youtube.com/watch?v=1v7RoeXyww4) - 202300912
* [Missing HTTP Security Headers - Bug Bounty Tips: youtube.com](https://www.youtube.com/watch?v=064yDG7Rz80)
