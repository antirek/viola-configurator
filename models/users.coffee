module.exports =
  mongo:
    name: String
    extension: String
    mobile: String
    record: String
    peername: String
    secret: String
    type: String
    context: String
    host: String
    qualify: String
    fwd: String
  schema:
    type: "object"
    title: "Users"
    properties:
      name:
        title: "Name"
        type: "string"
      extension:
        title: "Extension"
        type: "string"
      mobile:
        title: "Mobile"
        type: "string"
      record:
        title: "Record"
        type: "string"
      peername:
        title: "Peername"
        type: "string"
      secret:
        title: "Secret"
        type: "string"
      type:
        title: "Type"
        type: "string"
      context:
        title: "Context"
        type: "string"
      host:
        title: "Host"
        type: "string"
      qualify:
        title: "Qualify"
        type: "string"
      fwd:
        title: "Fwd"
        type: "string"

    required: [
      "name"
      "extension"
      "mobile"
      "record"
      "peername"
      "secret"
      "type"
      "context"
      "host"
      "qualify"
      "fwd"
    ]
  form: [
    "*",
  ]