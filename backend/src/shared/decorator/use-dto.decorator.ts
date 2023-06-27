import { AbstractEntity } from '@shared/abstract.entity';
import { AbstractDto } from '@shared/dto/abstract.dto';
import { Constructor } from '@shared/types/utility-types';

export function UseDto(
  dtoClass: Constructor<AbstractDto, [AbstractEntity, unknown]>,
): ClassDecorator {
  return (ctor) => {
    ctor.prototype.dtoClass = dtoClass;
  };
}
