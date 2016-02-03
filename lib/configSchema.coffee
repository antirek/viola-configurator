Joi = require('joi');

ConfigSchema = Joi.object().keys(
    port: Joi.number().required(),
    filePath: Joi.string().required(),
    sipConf: Joi.string().required(),
    mongodb: Joi.string().required(),
    ami: Joi.object().keys(
      host: Joi.string().required(),
      port: Joi.number().integer().min(1).max(65535).default(3306),
      username: Joi.string().required(),
      password: Joi.string().allow('').required(),
      debug: Joi.boolean().default(false)
    )
  )

module.exports = ConfigSchema