# UUID Converter for GTM Server Side

This **UUID Converter** template for Google Tag Manager Server Side takes an input string and generates a deterministic UUID based on the SHA-256 hash of the input. The UUID follows a simplified version of the v4 UUID format.

---

## Features

- **Convert Strings to UUID**: Converts any string into a UUID format compliant with a simplified version of the v4 standard.
- **Deterministic Output**: The same input string will always generate the same UUID, ensuring consistency.
- **Secure Hashing**: Utilizes the SHA-256 hashing algorithm for robust and collision-resistant conversion.

---

## Parameters

| Name             | Type  | Description                                       |
|------------------|-------|---------------------------------------------------|
| `data_to_uuid`   | Text  | The string to be converted into a UUID.           |

---

## Usage

1. **Add Template to GTM Server Side**:
   Import this macro template into your GTM Server-Side container.

2. **Configure Input**:
   - Set the `data_to_uuid` parameter with the string you wish to convert.

3. **Output**:
   The output will be a deterministic UUID in the format:
    xxxxxxxx-xxxx-4xxx-8xxx-xxxxxxxxxxxx

4. **Example**:
- Input: `exampleInputString`
- Output: `e99a18c4-dc78-4fae-8974-73f3c1e132b1`

---

## Internal Logic

The template performs the following:
1. Takes the input string provided in `data_to_uuid`.
2. Computes its SHA-256 hash.
3. Formats the hash into a simplified UUID v4 structure:
- 8 characters, followed by 4, 4, 4, and 12 characters separated by dashes.
- Ensures compliance with v4 UUID specifications for the version and variant fields.

---

## Example Test Case

The included test case validates the format of the generated UUID:
```javascript
const mockData = data.data_to_uuid;

// Call runCode to execute the template's logic
let variableResult = runCode(mockData);

// Assert the result matches the UUID v4 format
assertThat(variableResult).matches(/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i);
