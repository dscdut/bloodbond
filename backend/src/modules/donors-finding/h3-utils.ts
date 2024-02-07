import { latLngToCell, cellArea, UNITS, gridDisk } from 'h3-js';

import {
  DEFAULT_H3_RESOLUTION,
  GeoLocationInputH3,
  GeoLocationInputH3Arr,
} from './types/geo-location-input';

// make a map like {[h3Index]: [{user1, coord1}, {user2, coord2}, ...]}
export type H3IndexMap = {
  [h3Index: string]: GeoLocationInputH3[];
};

export function indexGeoLocationByUserId(
  geoLocationInput: GeoLocationInputH3Arr,
) {
  const resolution = DEFAULT_H3_RESOLUTION;
  // create a map like {userId1: h3Index1, userId2: h3Index2, ...}
  const h3IndexMap = {};

  geoLocationInput.forEach((each) => {
    const h3Index = latLngToCell(each.lat, each.lng, resolution);

    if (!h3IndexMap[each.userId]) {
      h3IndexMap[each.userId] = h3Index;
    }
  });

  return h3IndexMap;
}

export function indexGeoLocation(geoLocationInput: GeoLocationInputH3Arr) {
  const resolution = DEFAULT_H3_RESOLUTION;
  const h3IndexMap: H3IndexMap = {};

  geoLocationInput.forEach((each) => {
    const h3Index = latLngToCell(each.lat, each.lng, resolution);

    if (!h3IndexMap[h3Index]) {
      h3IndexMap[h3Index] = [];
    }

    h3IndexMap[h3Index].push({
      userId: each.userId,
      lat: each.lat,
      lng: each.lng,
    });
  });

  return h3IndexMap;
}

export async function kRingIndexesArea(
  geoLocationInput: GeoLocationInputH3,
  searchRadiusMeter: number,
) {
  const resolution = DEFAULT_H3_RESOLUTION;
  const origin = latLngToCell(
    geoLocationInput.lat,
    geoLocationInput.lng,
    resolution,
  );
  const originArea = cellArea(origin, UNITS.m2);
  const searchArea = Math.PI * searchRadiusMeter * searchRadiusMeter;

  let kRingIndex = 0;
  let diskArea = originArea;

  while (diskArea < searchArea) {
    ++kRingIndex;
    const cellCount = 3 * kRingIndex * (kRingIndex + 1) + 1;
    diskArea = cellCount * originArea;
  }

  return gridDisk(origin, kRingIndex);
}
