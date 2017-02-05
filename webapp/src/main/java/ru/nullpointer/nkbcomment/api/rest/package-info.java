/**
 * <p>
 * This is REST API documentation for NKB Comment System. 
 * API is HTTP based.
 * </p>
 * 
 * <h1>Request format</h1>
 * <h2>Resource URL</h2>
 * <p>
 * Resource URL consists of the following components: <code>{uri_base}/{resource}{type}</code>.
 * </p>
 * <p>
 * The <code>uri_base</code> component is predefined and known beforehand constant, e.g. <code>http://example.com/api</code>
 * </p>
 * <p>
 * For each resource there are defined HTTP method, <code>resource</code> component of URL, request body format and request parameters.
 * </p>
 * <p>
 * The <code>type</code> component of URL defines response content type. 
 * Supported formats are <code>.json</code> for <code>application/json</code> or <code>.xml</code> for <code>application/xml</code>. 
 * This component is optional and may be omitted. In such case request must contain appropriate <code>Accept</code> header.
 * </p>
 * <h2>Request body</h2>
 * <p>
 * Some resources expect data in body of request. Request body type must by either <code>application/json</code> or <code>application/xml</code>.
 * The content type of request body is defined by <code>Content-Type</code> request header.
 * </p>
 * <h2>Request parameters</h2>
 * <p>
 * Some resources take request parameters. 
 * In this case parameter names and values must be converted to UTF-8 and <a href="http://en.wikipedia.org/wiki/Percent_encoding">URL&nbsp;encoded</a>.
 * </p>
 * 
 * <h1>Response format</h1>
 * <h2>Response body</h2>
 * <p>
 * Some resources may return data in response body. 
 * The content type of response data is defined by <code>type</code> component of resource URL or by request <code>Accept</code> header.
 * </p>
 * <h2>Response status</h2>
 * <p>
 * Request response has one of the following HTTP statuses:
 * </p>
 * <ul>
 *      <li>
 *          <code>200 OK</code> - request is successfully fulfilled. Response body contains returned data.
 *      </li>
 *      <li>
 *          <code>201 Created</code> - request is successfully fulfilled with creation of resource. Response body contains response data. 
 *          Response <code>Location</code> header contains URL of newly created resource.
 *      </li>
 *      <li>
 *          <code>204 No Content</code> - request is successfully fulfilled. Response body contains no data.
 *      </li>
 *      <li>
 *          <code>400 Bad Request</code> - request is failed because of invalid request data,
 *          e.g body or parameters have illegal format or some required parameters are missing.
 *      </li>
 *      <li>
 *          <code>401 Unauthorized</code> - request is failed because user is not authenticated.
 *      </li>
 *      <li>
 *          <code>403 Forbidden</code> - request is failed because user is not permitted to access resource.
 *      </li>
 *      <li>
 *          <code>404 Not Found</code> - request is failed because resource with such URL does not exist.
 *      </li>
 *      <li>
 *          <code>405 Method Not Allowed</code> - request is failed because resource does not support request method.
 *      </li>
 *      <li>
 *          <code>409 Conflict</code> - request is failed because request data is in conflict with current state of resource. Resource state is not changed.
 *      </li>
 *      <li>
 *          <code>415 Unsupported Media Type</code> - request is failed because of unsupported format of request body.
 *      </li>
 *      <li>
 *          <code>500 Internal Server Error</code> - request is failed because of internal server error.
 *      </li>
 * </ul>
 * <p>
 * The general rule is that <code>20X</code> response status indicates successful request completion.
 * </p>
 * <p>
 * Response body for other status codes may contain data. The data is not guaranteed to be in machine-readable format and may be used for logging purposes only.
 * </p>
 * 
 * <h1>Authentication</h1>
 * <p>
 * TODO
 * </p>
 * 
 */
package ru.nullpointer.nkbcomment.api.rest;