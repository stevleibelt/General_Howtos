# HTTPS Headers

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

## Links

* [Learn in 5 Minutes: HTTP Headers (General/Request/Response/Entity): youtube.com](https://www.youtube.com/watch?v=1v7RoeXyww4) - 202300912
* [Missing HTTP Security Headers - Bug Bounty Tips: youtube.com](https://www.youtube.com/watch?v=064yDG7Rz80)
