#!/bin/bash
# Copyright 2015-2016 The Wazo Authors  (see the AUTHORS file)
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

for category in asterisk xivo ; do
	filename="${category}.tar.bz2"
	filename_sum="${category}.tar.bz2.sha256sum"
	push_url="mirror.wazo.community:/data/sounds/${filename}"

	rm -f "${filename}"
	tar cjf "${filename}" "${category}"
	sha256sum "${filename}" > "${filename_sum}"
	scp "${filename}" "${push_url}"
done
