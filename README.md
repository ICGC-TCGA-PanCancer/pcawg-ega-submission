# GitHub repository for tracking PCAWG data submission to EGA

## Overview
The repository is used to track EGA submission activities. In addition to metadata XMLs generated and submitted to EGA are added to this repo, EGA submission response in the form of EGA Receipt XMLs are to be recorded as well.

## SOP
### General note
Although git repo allows multiple users checkout make changes, to minimize possible confusions/conflicts, we propose only one person carries the submission tasks and updates the files. Submission tasks should be planed out and performed following this SOP closely.
### Submission tool
Follow the instruction in the README of this repo: https://github.com/ICGC-TCGA-PanCancer/ega-submission-tool to install the submission tool.
### Organization of this repo

Here shows how the repo is organized. Top level folders include 'settings', 'file_info', 'study' and individual project folders. Some details will be explained in specific steps. There also folders for testing purposes only, this is very good for checking out whether XMLs are valid and ready for real submission.
```
.
├── README.md
├── CLLE-ES
│   ├── analysis_alignment.PCAWG_RNA-Seq_TopHat2
│   ├── analysis_alignment.PCAWG_WGS_BWA
│   │   ├── GNOS_xml
│   │   └── analysis
│   ├── analysis_variation.PCAWG_Variant_Broad
│   ├── analysis_variation.PCAWG_Variant_Sanger
│   │   ├── GNOS_xml
│   │   └── analysis
│   └── sample
│       └── sample.CLLE-ES._all.tsv
├── TEST-PROJ
│   ├── README.md
│   ├── analysis_alignment.PCAWG_RNA-Seq_Star
│   ├── analysis_alignment.PCAWG_WGS_BWA
│   │   ├── GNOS_xml
│   │   │   ├── analysis.0010d26b-eb70-4f3f-b606-3db79ea97500.GNOS.xml
│   │   │   ├── analysis.0010d26b-eb70-4f3f-b606-3db79ea97500.GNOS.xml.gz
│   │   │   ├── analysis.f9f498a1-0293-488b-b634-b728f3bdcd73.GNOS.xml
│   │   │   └── analysis.f9f498a1-0293-488b-b634-b728f3bdcd73.GNOS.xml.gz
│   │   ├── analysis
│   │   │   ├── analysis.4d1fcef5-9c33-4852-963e-00dc2393eaf2.receipt-test_1454211239_b8438e54-89c2-4aef-8f5c-2dc6bd7cbc94.xml
│   │   │   ├── analysis.4d1fcef5-9c33-4852-963e-00dc2393eaf2.submission-test_1454211239_b8438e54-89c2-4aef-8f5c-2dc6bd7cbc94.xml
│   │   │   ├── analysis.4d1fcef5-9c33-4852-963e-00dc2393eaf2.xml
│   │   │   └── analysis.f00ee221-f51c-4fa9-bb62-8cb08a141bcd.xml
│   │   ├── dataset.TEST-PROJ_PCAWG_WGS_BWA.receipt-test_1454219288_8d4b33dc-2082-418c-b9c0-4f7b296a95e2.xml
│   │   ├── dataset.TEST-PROJ_PCAWG_WGS_BWA.submission-test_1454219288_8d4b33dc-2082-418c-b9c0-4f7b296a95e2.xml
│   │   └── dataset.TEST-PROJ_PCAWG_WGS_BWA.xml
│   ├── analysis_variation.PCAWG_Variant_Broad
│   ├── analysis_variation.PCAWG_Variant_Sanger
│   │   ├── GNOS_xml
│   │   │   └── analysis.3ba68314-53d7-40bd-9981-bfc248b592c3.xml
│   │   └── analysis
│   │       ├── analysis.3ba68314-53d7-40bd-9981-bfc248b592c3_cnv.xml
│   │       ├── analysis.3ba68314-53d7-40bd-9981-bfc248b592c3_snv.xml
│   │       └── analysis.3ba68314-53d7-40bd-9981-bfc248b592c3_sv.xml
│   └── sample
│       ├── sample.TEST-PROJ.1.receipt-test_1454127456_13d489e1-3f81-4e41-aa9c-d0fefc8b19e4.xml
│       ├── sample.TEST-PROJ.1.submission-test_1454127456_13d489e1-3f81-4e41-aa9c-d0fefc8b19e4.xml
│       ├── sample.TEST-PROJ.1.tsv
│       ├── sample.TEST-PROJ.1.xml
├── _test_file_info
│   ├── README.md
│   ├── file_info_missing
│   │   ├── 0010d26b-eb70-4f3f-b606-3db79ea97500
│   │   │   ├── analysis.0010d26b-eb70-4f3f-b606-3db79ea97500.GNOS.xml.gz.gpg
│   │   │   └── test.txt.gpg
│   │   ├── 296945a7-bd8a-4c2b-8e37-21cd84a7db93
│   │   │   └── analysis.296945a7-bd8a-4c2b-8e37-21cd84a7db93.GNOS.xml.gz.gpg
│   │   ├── 818d022e-24ba-4d00-bd58-37701deeb23e
│   │   │   └── test.txt.gpg
│   │   ├── f00ee221-f51c-4fa9-bb62-8cb08a141888
│   │   │   ├── analysis.f00ee221-f51c-4fa9-bb62-8cb08a141888.GNOS.xml.gz.gpg
│   │   │   └── test.txt.gpg
│   │   ├── f87f8019-db9f-46d0-9e39-d16a37646815
│   │   │   └── analysis.f87f8019-db9f-46d0-9e39-d16a37646815.GNOS.xml.gz.gpg
│   │   └── f9f498a1-0293-488b-b634-b728f3bdcd73
│   │       ├── 2aaf3eee5c612b9fd1507722dcaf91ab.bam.bai.gpg
│   │       └── analysis.f9f498a1-0293-488b-b634-b728f3bdcd73.GNOS.xml.gz.gpg
│   ├── files_missed_on_ftp_server
│   │   ├── 296945a7-bd8a-4c2b-8e37-21cd84a7db93
│   │   │   └── ab25474cdf02a11aa3aca157a359f638.bam.gpg
│   │   ├── 4d1fcef5-9c33-4852-963e-00dc2393eaf2
│   │   │   ├── 3bff6fb6d22946b29f935e60def05e65.bam.bai.gpg
│   │   │   └── 3bff6fb6d22946b29f935e60def05e65.bam.gpg
│   │   ├── f00ee221-f51c-4fa9-bb62-8cb08a141888
│   │   │   ├── e4bab214f06cb0664d4bb265fc3b9a1f.bam.bai.gpg
│   │   │   └── e4bab214f06cb0664d4bb265fc3b9a1f.bam.gpg
│   │   └── f87f8019-db9f-46d0-9e39-d16a37646815
│   │       └── 1faf4818aef944ccd0cea1553aa19f55.bam.gpg
│   └── file_info.tsv
├── file_info
│   ├── GNOS_xml_file_info
│   │   └── CLLE-ES.bwa_1454701663.tsv
│   ├── file_info_missing
│   ├── files_missed_on_ftp_server
│   └── file_info.tsv
├── settings
│   ├── analysis_alignment.template.xml
│   ├── analysis_variation.template.xml
│   ├── config.yaml
│   ├── dataset.template.xml
│   ├── sample.template.xml
│   ├── study.template.xml
│   └── submission.template.xml
└── study
    ├── study.PCAWG.receipt-1454091384_973e4531-4b02-4f52-a1fd-18ac602129ea.xml
    ├── study.PCAWG.receipt-test_1454286717_175839e3-46db-4819-a3f0-f3b32d28cd7a.xml
    ├── study.PCAWG.submission-1454091384_973e4531-4b02-4f52-a1fd-18ac602129ea.xml
    ├── study.PCAWG.submission-test_1454286717_175839e3-46db-4819-a3f0-f3b32d28cd7a.xml
    ├── study.PCAWG.xml
    └── study.PCAWG.yaml
```
### Submission steps
#### Stage data files on EGA FTP server
This step is being taken care of by EGA friends who have been transfering data from Barcerlona GNOS to EGA. All staged files will need to have md5sum collected for original file and encrypted version. This information is to be kept in `file_info/staged_files.tsv`. In case, such information is missing for any files to be submitted to EGA, the submission tool will report them to here: `file_info/file_info/missing`.

While preparing metadata XMLs the submission tool will also peek into the EGA FTP server to check whether the required files exist on the server, if not, it will be reported under `file_info/missed_files`. Follow-up action is needed to stage those files.

#### Prepare and submit STUDY metadata
The very first metadata object to be submitted is STUDY. This needs to take place under the `study` folder.

```
cd study
ega_sub --auth 'xxxx' prepare study study.PCAWG.yaml
ega_sub --auth 'xxxx' submit study study.PCAWG.xml
```

In fact, this is alreay DONE. No action here unless modification is needed.

#### Proceed to submission project by project
Once `study` is submitted, we perform data submission project by project. Within one project, all SAMPLE objects must be prepared and submitted first. Sample information is prepared first in a TSV file, which will be then used to generate EGA sample XML. Assume the sample TSV is already made in `sample.CLLE-ES._all.tsv`. To prepare the sample EGA XML, do this:

```
cd CLLE-ES/sample
ega_sub --auth 'xxx' prepare sample sample.CLLE-ES._all.tsv
```

An XML file will be generated as `sample.CLLE-ES._all.xml`. Now to submit it:
```
ega_sub --auth 'xxx' submit sample sample.CLLE-ES._all.xml
```

It's possible to perform test submission by adding `--test` option, which will submit the XML to the EGA test server.

Next, we will submit one data type at a time and we start with WGS BAM alignment data. This step requires all GNOS metadata XMLs be downloaded and put under `analysis_alignment.PCAWG_WGS_BWA/GNOS_xml`. Each XML file will need to have a gzipped version which will be staged on the EGA FTP as we are submitting them to fully archive all GNOS metadata to avoid information loss.

To prepare EGA alignment Analysis XML, do this:
```
cd analysis_alignment.PCAWG_WGS_BWA
ega_sub --auth 'xxxx' prepare analysis GNOS_xml
```
This will generate Analysis XMLs in `analysis_alignment.PCAWG_WGS_BWA/analysis` that will then be used for submission.
```
ega_sub --auth 'xxxx' submit analysis analysis
```
Upon successful submission, EGA receipt XML will be stored under the same folder for later use.

Finally, after all Analysis objects are submitted to EGA, we create EGA dataset which will include all these Analysis objects.
This is done the following two steps:
```
ega_sub --auth 'xxxx' prepare dataset analysis
ega_sub --auth 'xxxx' submit dataset analysis
```
Important, this must be done after all analysis objects have been submitted. We create only one dataset for each data type per ICGC project.

Once done with one data type, we can move on to the other data type in the same project or move on to another project.

### Tips
- Practise as much as needed using the TEST-* projects.
- After each successful step (eg. XML preparation or submission), git add and commit the new files.
