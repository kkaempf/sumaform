{% if grains['for_testsuite_only'] %}

include:
  - client.repos

cucumber_requisites:
  pkg.installed:
    - pkgs:
      - subscription-tools
      - spacewalk-client-setup
      - spacewalk-check
      - spacewalk-oscap
      - rhncfg-actions
      - openscap-extra-probes
      - openscap-utils
      - man
      - wget
      - adaptec-firmware
      {% if grains['os'] == 'SUSE' %}
      - openscap-content
      - andromeda-dummy
      - milkyway-dummy
      - virgo-dummy
      - aaa_base-extras
      {% endif %}
    - require:
      - sls: client.repos

{% if grains['os_family'] == 'Suse' %}
enforce_latest_libzypp:
  pkg.latest:
    - name: libzypp
    - require:
      - sls: client.repos
{% endif %}
{% endif %}
