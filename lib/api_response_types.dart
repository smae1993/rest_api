enum ResponseType {
  unknown(1, ResponseTypeGroup.unknown),

  /// informations
  coutinue(100, ResponseTypeGroup.information),
  switchingProtocols(101, ResponseTypeGroup.information),
  processing(102, ResponseTypeGroup.information),

  /// successes
  ok(200, ResponseTypeGroup.success),
  created(201, ResponseTypeGroup.success),
  accepted(202, ResponseTypeGroup.success),
  nonAuthoritativeInformation(203, ResponseTypeGroup.success),
  noContent(204, ResponseTypeGroup.success),
  resetContent(205, ResponseTypeGroup.success),
  partialContent(206, ResponseTypeGroup.success),
  multiStatus(207, ResponseTypeGroup.success),
  alreadyReported(208, ResponseTypeGroup.success),
  iMUsed(226, ResponseTypeGroup.success),

  /// redirections
  multipleChoices(300, ResponseTypeGroup.redirection),
  movedPermanently(301, ResponseTypeGroup.redirection),
  found(302, ResponseTypeGroup.redirection),
  seeOther(303, ResponseTypeGroup.redirection),
  notModified(304, ResponseTypeGroup.redirection),
  useProxy(305, ResponseTypeGroup.redirection),
  temporaryRedirect(307, ResponseTypeGroup.redirection),
  permanentRedirect(308, ResponseTypeGroup.redirection),

  /// errors
  badRequest(400, ResponseTypeGroup.error),
  unAuthorized(401, ResponseTypeGroup.error),
  paymentRequired(402, ResponseTypeGroup.error),
  forbidden(403, ResponseTypeGroup.error),
  notFound(404, ResponseTypeGroup.error),
  methodNotAllowed(405, ResponseTypeGroup.error),
  notAcceptable(406, ResponseTypeGroup.error),
  proxyAuthenticationRequired(407, ResponseTypeGroup.error),
  requestTimeout(408, ResponseTypeGroup.error),
  conflict(409, ResponseTypeGroup.error),
  gone(410, ResponseTypeGroup.error),
  lengthRequired(411, ResponseTypeGroup.error),
  preconditionFailed(412, ResponseTypeGroup.error),
  requestEntityTooLarge(413, ResponseTypeGroup.error),
  requestURITooLong(414, ResponseTypeGroup.error),
  unsupportedMediaType(415, ResponseTypeGroup.error),
  requestedRangeNotSatisfiable(416, ResponseTypeGroup.error),
  expectationFailed(417, ResponseTypeGroup.error),
  imATeapot(418, ResponseTypeGroup.error),
  enhanceYourCalm(420, ResponseTypeGroup.error),
  unprocessableEntity(422, ResponseTypeGroup.error),
  locked(423, ResponseTypeGroup.error),
  failedDependency(424, ResponseTypeGroup.error),
  reservedForWebDAV(425, ResponseTypeGroup.error),
  upgradeRequired(426, ResponseTypeGroup.error),
  preconditionRequired(428, ResponseTypeGroup.error),
  tooManyRequests(429, ResponseTypeGroup.error),
  requestHeaderFieldsTooLarge(431, ResponseTypeGroup.error),
  noResponse(444, ResponseTypeGroup.error),
  retryWith(449, ResponseTypeGroup.error),
  blockedByWindowsParentalControls(450, ResponseTypeGroup.error),
  unavailableForLegalReasons(451, ResponseTypeGroup.error),
  clientClosedRequest(499, ResponseTypeGroup.error),

  ///serverErrors
  internalServerError(500, ResponseTypeGroup.serverError),
  notImplemented(501, ResponseTypeGroup.serverError),
  badGateway(502, ResponseTypeGroup.serverError),
  serviceUnavailable(503, ResponseTypeGroup.serverError),
  gatewayTimeout(504, ResponseTypeGroup.serverError),
  httpVersionNotSupported(505, ResponseTypeGroup.serverError),
  variantAlsoNegotiates(506, ResponseTypeGroup.serverError),
  insufficientStorage(507, ResponseTypeGroup.serverError),
  loopDetected(508, ResponseTypeGroup.serverError),
  bandwidthLimitExceeded(509, ResponseTypeGroup.serverError),
  notExtended(510, ResponseTypeGroup.serverError),
  networkAuthenticationRequired(511, ResponseTypeGroup.serverError),
  networkReadTimeoutError(598, ResponseTypeGroup.serverError),
  networkConnectTimeoutError(599, ResponseTypeGroup.serverError);

  const ResponseType(this.code, this.group);
  final int code;
  final ResponseTypeGroup group;
}

enum ResponseTypeGroup {
  unknown,
  information,
  success,
  redirection,
  error,
  serverError
}
