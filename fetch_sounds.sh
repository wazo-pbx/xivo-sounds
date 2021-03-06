#!/bin/bash
# Copyright 2015-2019 The Wazo Authors  (see the AUTHORS file)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>

set -e

for category in asterisk wazo ; do
	filename="${category}.tar.bz2"
	filename_sum="${category}.tar.bz2.sha256sum"
	url="https://mirror.wazo.community/sounds/${filename}"

	rm -rf "${category}"
	wget -nv -O "${filename}" "${url}"
	sha256sum --strict -c "${filename_sum}"
	tar xf "${filename}"
done
