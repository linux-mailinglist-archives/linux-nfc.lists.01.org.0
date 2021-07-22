Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93313D225B
	for <lists+linux-nfc@lfdr.de>; Thu, 22 Jul 2021 12:59:36 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5BA05100EBBCE;
	Thu, 22 Jul 2021 03:59:33 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=vindrg@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CE35F100EBBA2
	for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 03:59:30 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id dp20so7747065ejc.7
        for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=89rbfXPOE43847Zq2TcfZiQgBlCP5LK17dhZOLCZroA=;
        b=OzHq22WILvZpA5EPB5KHZgLpg+6ghxf/xpR6Pa7bJZFZaNDDuTtc/6b5WsRf8JJJKf
         jet5i8qyat41MmCAVwq8dNT6s0g4LBK8+kXD+Pq1vfgHgMWqZeNvqTolymdOR6xNjzNg
         5ZKcOKKS8G5CFU9Htvie5iqiDSy7q/8EilJ/z15MLURyFKWRsGSYK56EQEbnLThzQkH7
         JF2f4W+i5O8h2xHESDo/lD4IVhMPGddsiyTN8NgqeRleAKZwI35uY0RnyT//+7JSAiuk
         llyf3MYTc2EW6szBYWbRpqdWejwAmsYvHuwdSmMYHzmJy0zdgsbTW8Prj5ijNdWTZyR7
         Nfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=89rbfXPOE43847Zq2TcfZiQgBlCP5LK17dhZOLCZroA=;
        b=Gi01g1XWwW90JVv4l6hkrC+1hYOwnd1uivvb6VO+qA1lW/3LKxctKluDX+IbQQpASv
         ItkMySJHVoiuCYN0mJzDD7HInyaBwTAz67Htone0C6HuTll+XP9vNCdvfn08Cxc+3SJX
         n/s+UdqMTTpGtnV6VWWaSeQ/83o9Ym8b0VfJABl/UKlOiiH9fsWeN54Kid56Qse2Zq6d
         3L5vK00+z7RPlQwpmZTEGC2d62mpK9hsVSndDUtdjdDZcD8p+VXpt3f3gEzO1LndsmMM
         IYHR/3Qg5CkjUUn/igKzBII5VTSqrS9ZnkN8uHLwL+nHUgDjJlabtKbMpSMcCz2zlKZu
         Vz3g==
X-Gm-Message-State: AOAM531f9s5UMvRGzbNdPRsKR45JLHRAuxAvghIHMq70isS9wInwLfMB
	6tD8VetJ5NqZF1z130AOZA9IkZgIYnE7wegKPahVz53UktFByhL/8VNSBg==
X-Google-Smtp-Source: ABdhPJyaGIaGl5eXw7y9s4v9DLdAPsZJbt/O1EuZpd8zHrlDpDKHSc/MwloqAP8I4klz/WNpzEq+bxOUtW3Zh0AJ49Q=
X-Received: by 2002:a17:906:a897:: with SMTP id ha23mr41576833ejb.164.1626951568218;
 Thu, 22 Jul 2021 03:59:28 -0700 (PDT)
MIME-Version: 1.0
From: Vincas Dargis <vindrg@gmail.com>
Date: Thu, 22 Jul 2021 13:59:17 +0300
Message-ID: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
To: linux-nfc@lists.01.org
Message-ID-Hash: HNAR3TCOIOQPUTB5UWUIFWKJL326AKXC
X-Message-ID-Hash: HNAR3TCOIOQPUTB5UWUIFWKJL326AKXC
X-MailFrom: vindrg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] About NFC Tag emulation on Linux
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HNAR3TCOIOQPUTB5UWUIFWKJL326AKXC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi list,

I see there's "test-device", "test-tag" helpers in neard-tools package
in Debian, but it looks like it needs actual devices/tags to test
with..?

Is there a way to emulate NFC tag, to "emit" NFC tag discovery events
and NDEF mesages on Linux? Qt supports NFC on Linux via neard daemon,
so I thought it would be very useful to emulate NFC tags (with various
payloads) for development and (automated even?) testing.

Thanks!
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
