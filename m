Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811CF1B537
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 13:46:51 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CDA4A21268F8A;
	Mon, 13 May 2019 04:46:49 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 82F7C21237ACD
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:46:48 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c66so5956874wme.0
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=MQMtcXPbWQFD7gNVoU802mYFs0P70ei96xJMVgcVxUw=;
 b=nDXaPbwxR8NZNqdJj5hOmZzxGI/E3QaiqmVUza5jqgFzLvWWWP5Jyqxx8nY7k/nbMR
 1cOmMs3eQ/IGeq5bcTkdnzztveqL4oJgZVCe8Izl2AjvT0Pb/Bk8q+NxwtkX3sbYLOqy
 x69UcmX1tgccZ8q99pO9q1HDHdiyJn3HyLJPNoG1sZWrD4NrVO398sWEOL5lUc5x5rGk
 hhJuVQUDL6DpGGkzOp9pxoeN+3mGUlqfdC/jZmva1rJdY0SikrkcgN3JmRhyNC7Eemu5
 nMk1I4dsw5hoGwlvD6NudD4nj7a3IXmbQI0mo0/Ujz0AH8HF7BfqRyGZSRnDqYFDnczU
 p+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=MQMtcXPbWQFD7gNVoU802mYFs0P70ei96xJMVgcVxUw=;
 b=Cg55MJTEflU88TTftHQFjuR+LXbGOt8Ey7mpHktz5f5rSZ0eqTz/7dsOV7KZg1jTMQ
 dVhHurmrci1eGX3KAy42kjmtNVA2mpeSIBMULyFSJqReN7t7s1b+Mflbx3G4YCVP/TUa
 588FJfFIQIAhK6VYLquOVjr0s3h8AlTRELUOSZMyfSQA/h4rzKMOuP6NrkZQIKHSjfTR
 CueIxrG5AljTdwa8ZhYdqiOoezhNltIdDS0aGJaY2G0U47ShK1+5cgLxckbdc+Pj9CLr
 ytEySsPsnC01hY789+kPA3D7oXmpZglKWX2CdccRgzxFgbcQ+qAZK+SWypyeQf1AfTqs
 I0GA==
X-Gm-Message-State: APjAAAX2BqPGWTWsX0jMMBtEZ+qXRmBJYO4lY9b3NCJ3Roc4dmgaZl6D
 NqzbLxNQjGNEvx75G2ze7+j0BdYPdDq94YJ/M54=
X-Google-Smtp-Source: APXvYqz/F7P58lUrsX+UaqNuWE6awO8d2zMbjz3tSExHr29ZgcsqrZ4r8WZTxCPb9JRshP5ndvosPZh94xxhHMeYcWI=
X-Received: by 2002:a1c:f606:: with SMTP id w6mr14378897wmc.130.1557748006902; 
 Mon, 13 May 2019 04:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUUu6NmQoKS-2x32Fz388Q_ahXyYzLLf5JNm=mZR+r-0kQ@mail.gmail.com>
In-Reply-To: <CA+icZUUu6NmQoKS-2x32Fz388Q_ahXyYzLLf5JNm=mZR+r-0kQ@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 13:46:36 +0200
Message-ID: <CA+icZUWgQQ-h+e=fvb+yheZRm5NuL=YGMmVSjEnAizKPtMqhvg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [linux-nfc] [PATCH v2 00/12] NFC: nxp-nci: clean up and support
 new ID
X-BeenThere: linux-nfc@lists.01.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nfc/>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 Charles Gorand <charles.gorand@effinnov.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On Mon, May 13, 2019 at 1:43 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
[...]

> root@iniza:~# nfctool --poll -d nfc0
> Start polling on nfc0 as initiator
>
> Targets found for nfc0
>   Tags: [ tag1 ]
>   Devices: [ ]
>

That "tag1" was my YubiKey after putting it on the NFC sticker on my
ThinkPad T470.

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
