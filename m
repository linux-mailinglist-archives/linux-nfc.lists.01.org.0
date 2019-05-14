Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDBF1C3AB
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 09:12:21 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1618121274209;
	Tue, 14 May 2019 00:12:20 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id C77FB21C93EDB
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 00:12:17 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w8so15426873wrl.6
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 00:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=5TBZtrU9B5v1RR9R3L6q6afA0gwCnyufeN3SvVzQC6U=;
 b=SscvLm85rwUhgPIOI+6lXjo/V8Kk8l/aF5XFDdS+S+PFGs1jAUTuzlEbEDG84q1F+5
 1DjU2NkK6gL55w5cYr9eAtQ3Knfy9XHjoTkc29XSE2SdR2CdAQNRxN+tL1S+uz183bBi
 dqxS/f3cJ2JX+hPf3+376olf1Vo6/+vRBF9jkYXdg8Lu4iteDqE3FursycqyDSKq4zyP
 HuMTgTkp3/3IvPXc3tp6eBXMMYFaZYhlaabvFTvrIzYUI5+qdFWw2dWc4ITeEjZe8Tdd
 NuzMNtgWMHIr/AB4yzNNwqQE/vwi7U4v0z0PVdfEA4jqEaakV+nIC4dFJDyKrx+qT5J0
 VNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=5TBZtrU9B5v1RR9R3L6q6afA0gwCnyufeN3SvVzQC6U=;
 b=WzU39dGHxBQZ88EVlpbL94qgpxYZtwAh7h9DS+HIodU1jdp2afa6FLuhe6rJgYc3Nb
 hgfNebhLArNbNvJY9MrKTRNRzwIxxXmruP29HzCu6E9hzJOvQe98NLArvcRwCjmF3cnP
 cY0NKG8MFrVo3wl3KbxmYleoZcW4EozvNCLqMOo+FLOd+c5/JS/mWdD0uZisLjEuMPiC
 ME+iaWLLKzUw3kEZuGwz/O3O7Kn5Jp4PqhRtMNAc4KBVUkbTA0Y1G/lEKUT1uSdpVl2I
 jgRUAm3HuFDqLHZaG5RlxmNNRIBNjmKjASSr9hM3jdB7/Y78f1JP3xBRn4ELCLR6+RFF
 msOg==
X-Gm-Message-State: APjAAAWsViWt4FLBJILRmDwtfREaiKfTvAbh/GdglI6YVMKvYiEJa9WP
 IPvnMECErLwwF8XtpFVm8xvbeupPuwAci3y/BN0=
X-Google-Smtp-Source: APXvYqzCNWIgXU60uvNcpiMtFkO2Pt7ILXzWpruzNIgkqHknyDSPzew4pknH6+wxdFZCdIqEFn7WvnDbpwj/cZFtYQY=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr8484033wrq.285.1557817936299; 
 Tue, 14 May 2019 00:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUWLBjTtcFS0Fo8M5gSb90GbEUpetUgwr3fy=NxGAVqCyw@mail.gmail.com>
 <ecfdf017-59b0-dcb8-f684-1e4ba3d82a28@linaro.org>
In-Reply-To: <ecfdf017-59b0-dcb8-f684-1e4ba3d82a28@linaro.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 09:12:04 +0200
Message-ID: <CA+icZUV0qVmtz6xXYMM7gxJs21H_sQxYK=EeHeXbv=H6LAXeNw@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [linux-nfc] NXP NFC version and ACPI
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
 charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On Tue, May 14, 2019 at 8:57 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 14/05/2019 08:52, Sedat Dilek wrote:
>
> [ ... ]
>
> >>> Please give this a try and report.
> >>
> >> My laptop is the first one I have with a NFC reader, so I'm not used to
> >> test this as it was not working yet.
> >>
> >> I booted the machine with a 5.1.1, the series applied on top, and the
> >> config options set as mentioned above.
> >>
> >> The nxp-nci kernel module is loaded and neard is installed.
> >>
> >> I used the sniffing tool with the command libnfc -d nfc0 -n but when
> >> passing my NFC devices on the laptop's NFC mark, nothing happens.
> >>
> >> Is that correct?
> >>
> >
> > Hi Daniel,
> >
> > I am new to the topic Linux NFC.
> >
> > I have installed neard (daemon) v0.16 and neard-tools from Debian/buster AMD64.
> >
> > root@iniza:~# systemctl is-active neard.service
> > active
>
> Same for me
>
> > root@iniza:~# nfctool --list
> > nfc0:
> >           Tags: [ ]
> >           Devices: [ ]
> >           Protocols: [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
> >           Powered: No
> >           RF Mode: None
> >           lto: 150
> >           rw: 15
> >           miux: 2047
>
> I have:
>
> nfc0:
>           Tags: [ ]
>           Devices: [ ]
>           Protocols: [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
>           Powered: Yes
>           RF Mode: None
>           lto: 150
>           rw: 15
>           miux: 2047
>
> The powered field is different.
>
> > root@iniza:~# nfctool --poll -d nfc0
>
> > Start polling on nfc0 as initiator
> >
>
> I have:
>
> Protocol error
>
>
> And the dmesg show me the errors related to nci:
>
> [  343.056021] nci: nci_ntf_packet: unknown ntf opcode 0x0
> ...
> [31611.394308] nci: nci_start_poll: failed to set local general bytes
>
>

I cannot say much to this.

For the sake of completeness:
I have the patch "NFC: fix attrs checks in netlink interface" applied.

- Sedat -

[1] https://patchwork.kernel.org/patch/10339089/
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
