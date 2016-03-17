module.exports =
  mongo:
    name: String
    filename: String
    extension: String
    maxdigits: String
    options: String
    attempts: String
    timeout: String
    choices: [
      key: String
      action: String
    ]
  schema:
    type: "object"
    title: "Ivrs"
    properties:
      name:
        title: "Name"
        type: "string"
      extension:
        title: "Extension"
        type: "string"
      maxdigits:
        title: "Maxdigits"
        type: "string"
      options:
        title: "Options"
        type: "string"
      attempts:
        title: "Attempts"
        type: "string"
      timeout:
        title: "Timeout"
        type: "string"
      choices:
        title: "Choices"
        type: "array"
        items:
          type: "object"
          title: 'Choice'
          properties:
            key:
              title: "Kame"
              type: "string"
            action:
              title: "Action"
              type: "string"

    required: [
      'name'
      'filename'
      'extension'
      'maxdigits'
      'options'
      'attempts'
      'timeout'
      'choices'
    ]
  form: [
    "*",
  ]
