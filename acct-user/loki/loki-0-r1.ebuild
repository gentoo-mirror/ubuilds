# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="user for loki"
ACCT_USER_ID=405
ACCT_USER_GROUPS=( loki )

acct-user_add_deps
