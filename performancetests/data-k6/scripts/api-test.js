// import necessary modules
import { check } from 'k6';
import http from 'k6/http';

// define configuration
export const options = {
  // define thresholds
  thresholds: {
    http_req_failed: [{ threshold: 'rate<0.01', abortOnFail: true }], // availability threshold for error rate / http errors should be less than 1%
    http_req_duration: ['p(99)<5000'], // Latency threshold for percentile / 99% of requests should be below 5s
  },
  // define scenarios
  scenarios: {
    breaking: {
      executor: 'ramping-vus',
      stages: [
        // ramp up to average load of 20 virtual users
        { duration: '10s', target: 20 },
        // maintain load
        { duration: '50s', target: 20 },
        // increase load
        { duration: '50s', target: 40 },
        { duration: '50s', target: 60 },
        { duration: '50s', target: 80 },
        { duration: '50s', target: 100 },
        { duration: '50s', target: 120 },
        { duration: '50s', target: 140 },
        //....
      ],
    },
  },
};

export default function () {
  // define URL and request body
  const url = 'https://test-api.k6.io/auth/basic/login/';
  const payload = JSON.stringify({
    username: 'test_case',
    password: '1234',
  });
  const params = {
    headers: {
      'Content-Type': 'application/json',
    },
  };

  // send a post request and save response as a variable
  const res = http.post(url, payload, params);

  // check that response is 200
  check(res, {
    'response code was 200': (res) => res.status == 200,
  });
}

// DOCS: https://grafana.com/docs/k6/latest/examples/get-started-with-k6/analyze-results/
// https://grafana.com/grafana/dashboards/?search=k6
// http://localhost:3000/dashboard/import
// https://grafana.com/docs/grafana/latest/getting-started/build-first-dashboard/
// https://www.youtube.com/watch?v=RYyPduBqGM4
// https://grafana.com/docs/k6/latest/get-started/running-k6/
// https://github.com/SebastiaandenBoer/mendix-robot-framework-demo/wiki/Workshop-Resources