module.exports =
  mongo:
    name: String
    title: String
  schema:
    type: "object"
    title: "Ivrs"
    properties:
      name:
        title: "Name"
        type: "string"
      title:
        title: "Title"
        type: "string"

    required: [
      'name'
      'title'
    ]
  form: [
    "*",
  ]
