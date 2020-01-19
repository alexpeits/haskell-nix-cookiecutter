# {{cookiecutter.package_name}}

{% if cookiecutter.gh_pages == 'y' and cookiecutter.git_username != '' and cookiecutter.git_repo_name != '' -%}
View the [docs]<https://{{cookiecutter.git_username}}.github.io/{{cookiecutter.git_repo_name}}>
{% else -%}
View the [docs]<docs/docs.md>
{%- endif %}

asdf

