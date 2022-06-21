exports.handler = async (event) => {
	// Get Contents of CF response :
	const res = event.Records[0].cf.response;

	// set required security headers :
	res.headers["x-frame-options"] = [{ key: "X-Frame-Options", value: "DENY" }];
	res.headers["x-xss-protection"] = [
		{ key: "X-XSS-Protection", value: "1; mode=block" },
	];
	res.headers["referrer-policy"] = [
		{ key: "Referrer-Policy", value: "no-referrer" },
	];

	return res;
};
