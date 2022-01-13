/**
 *  wfApi,
 *  Copyright (C) 2018 Ilkka Kuosmanen
 *
 *  This file is part of wfApi.
 *
 *  wfApi is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  wfApi is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with wfApi.  If not, see <http://www.gnu.org/licenses/>.
 */
'use strict';

class Stat {
  constructor (name, flags) {
    this.name = name;
    this.value = 0;
    this.flags = flags;

    // Setup the buffers
    this.minuteBuffer = [];
    this.hourBuffer = [];
    this.dayBuffer = [];
    for (let i = 0; i < 60; i++) {
      this.minuteBuffer[i] = 0;
      this.hourBuffer[i] = 0;
      if (i < 24) {
        this.dayBuffer[i] = 0;
      }
    }

    let date = new Date;
    if (this.flags.indexOf('s') > -1) {
      this.minuteBufferIndex = date.getSeconds();
      let secondInterval = setInterval(Stat._clearNextSecond, 1000, this);
      secondInterval.unref();
    }
    if (this.flags.indexOf('m') > -1) {
      this.hourBufferIndex = date.getMinutes();
      let minuteInterval = setInterval(Stat._clearNextMinute, 1000 * 60, this);
      minuteInterval.unref();
    }
    if (this.flags.indexOf('h') > -1) {
      this.dayBufferIndex = date.getHours();
      let hourInterval = setInterval(Stat._clearNextHour, 1000 * 60 * 60, this);
      hourInterval.unref();
    }
  }

  hit () {
    let date = new Date;
    this.value += 1;
    this.minuteBuffer[date.getSeconds()]++;
    this.hourBuffer[date.getMinutes()]++;
    this.dayBuffer[date.getHours()]++;
  }

  getFlags () {
    return this.flags;
  }

  getName (flag) {
    let name = this.name + ' since server start.';
    if (flag) {
      name = this.name + ' / ' + flag[3] + ' (last ';
      switch (flag[3]) {
        case 's':
          name += 'minute)';
          break;
        case 'm':
          name += 'hour)';
          break;
        case 'h':
          name += 'day)';
          break;

      }
    }
    return name;
  }

  getTotal () {
    return this.value;
  }

  getPerSecond () {
    return Stat._average(this.minuteBuffer).toFixed(2);
  }

  getPerMinute () {
    return Stat._average(this.hourBuffer).toFixed(2);
  }

  getPerHour () {
    return Stat._average(this.dayBuffer, 24).toFixed(2);
  }

  getValueForFlag (flag) {
    if (this.flags.indexOf(flag[3]) > -1) {
      switch (flag[3]) {
        case 's':
          return this.getPerSecond();
        case 'm':
          return this.getPerMinute();
        case 'h':
          return this.getPerHour();
        default:
          return this.getTotal();
      }
    }
  }

  static _clearNextSecond (obj) {
    obj.minuteBuffer[obj.minuteBufferIndex] = 0;
    obj.minuteBufferIndex++;
    if (obj.minuteBufferIndex > 59) {
      obj.minuteBufferIndex = 0;
    }
  }

  static _clearNextMinute (obj) {
    obj.hourBuffer[obj.hourBufferIndex] = 0;
    obj.hourBufferIndex++;
    if (obj.hourBufferIndex > 59) {
      obj.hourBufferIndex = 0;
    }
  }

  static _clearNextHour (obj) {
    obj.dayBuffer[obj.dayBufferIndex] = 0;
    obj.dayBufferIndex++;
    if (obj.dayBufferIndex > 59) {
      obj.dayBufferIndex = 0;
    }
  }

  static _average (arr, length) {
    if (!arr) {
      return 0;
    }
    let sum = arr.reduce((a, b) => {
      return a + b;
    });
    let div = 60;
    if (length) {
      div = length;
    }
    return sum / div;
  }
}

class StatManager {
  constructor () {
    this.stats = [];
  }

  registerStat (name, flags) {
    if (this.stats.findIndex(x => x.name === name) > -1) {
      return;
    }
    this.stats.push(new Stat(name, flags));
  }

  hit (name) {
    let index = this.stats.findIndex(x => x.name === name);
    if (index === -1) {
      return;
    }
    this.stats[index].hit();
  }

  getArray () {
    let ret = [];
    for (let key in this.stats) {
      if (!this.stats.hasOwnProperty(key)) {
        continue;
      }
      let flags = this.stats[key].getFlags();
      ret.push({
        name: this.stats[key].getName(),
        value: this.stats[key].getTotal()
      });
      if (flags) {
        let reg = /((\d*)(\w))/g;
        let f = '';
        while ((f = reg.exec(flags)) !== null) {
          ret.push({
            name: this.stats[key].getName(f),
            value: this.stats[key].getValueForFlag(f)
          });
        }
      }
    }
    return ret;
  }
}

module.exports = {
  StatManager
};
