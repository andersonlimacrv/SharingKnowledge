### helm is a tool to help you define, install, and upgrade applications running on Kubernetes
[helm](https://helm.sh/)


[source](https://viblo.asia/p/helm-la-gi-no-co-lien-quan-gi-den-series-nay-Do754oAQlM6)


```html
hi team,
I have a curious question about the relationship btw [helm-chart] and [infrastructure]
Do the values [helm-chart] here can be used in [infrastructure]

>>

The answer is YES.
if you dive deep to eh-app in eh-helm-chart, you can see that when apm_enabled: true,
your-app will add some envs to the service. You can see it here:

- name: DD_TRACE_SAMPLE_RATE
  value: {{ $.Values.datadog.trace_sample_rate | quote }}

>>

you can think [your-app] in [helm-chart] is a template for the your-app services,
it bases on the values of service manifest then render to the corresponding service.
It is like the rails template render
```
