___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "UUID converter",
  "categories": ["DATA_WAREHOUSING", "ANALYTICS"],
  "description": "Converts a string object to UUID format: https://en.wikipedia.org/wiki/Universally_unique_identifier",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "data_to_uuid",
    "displayName": "Field to be converted",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const sha256Sync = require('sha256Sync');
const log = require('logToConsole');

function stringToDeterministicUUID(inputString) {
  // get the SHA-256 hash of the input string
  var hash = sha256Sync(inputString, {outputEncoding: 'hex'});

  // Format the hash as a simplified v4-like UUID
  var uuid = hash.substring(0, 8) + '-' +  // 8 characters
             hash.substring(8, 12) + '-' + // 4 characters
             '4' + hash.substring(13, 16) + '-' + // Version 4
             '8' + hash.substring(17, 20) + '-' + // Variant
             hash.substring(20, 32); // Last 12 characters

  return uuid;
}

// return the result
var inputString = data.data_to_uuid;
var deterministicUUID = stringToDeterministicUUID(inputString);
log('Deterministic UUID: ' + deterministicUUID);
return deterministicUUID;


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: test_string_with_characters
  code: |-
    const mockData = data.data_to_uuid;

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).matches(/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i);


___NOTES___

Created on 13/12/2024, 11:48:37


