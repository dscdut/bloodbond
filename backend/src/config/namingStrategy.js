/* eslint-disable */
const NamingStrategy = require('typeorm-model-generator/dist/src/NamingStrategy');

NamingStrategy.entityName = function (entityName, entity) {
  entityName = entityName.replace(/s$/, '');
  return entityName;
};

NamingStrategy.fileName = function (fileName) {
  return fileName.replace(/s$/, '') + '.entity';
};

module.exports = {
  ...NamingStrategy,
};
