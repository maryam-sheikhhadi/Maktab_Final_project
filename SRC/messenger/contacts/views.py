import itertools
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import Q
from django.shortcuts import render, redirect
from django.views import View
from django.views.generic import ListView, DetailView, UpdateView, DeleteView
from accounts.models import User
from .forms import ContactModelForm
from .models import Contact
from django.http import HttpResponse
import csv
from django.http import JsonResponse
import json
from django.contrib.auth.decorators import login_required
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions
from .serializer import ContactSerializer
import logging
from django.contrib import messages


logger = logging.getLogger('contacts')


class ContactsList(APIView):  # Contacts List for any User
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request, *args, **kwargs):
        contacts = Contact.objects.filter(user=request.user)  # queryset
        x = ContactSerializer(contacts, many=True)  # serializer(queryset)
        return Response({
            'contacts': x.data
        })


class CreateContact(LoginRequiredMixin, View):

    def get(self, request):
        form = ContactModelForm()
        return render(request, 'contacts/create_contact.html', {"form": form})

    def post(self, request):
        form = ContactModelForm(request.POST)
        if form.is_valid():

            usernames = User.objects.all().values_list('username', flat=True)
            if form.cleaned_data['email'] not in usernames:
                messages.add_message(request, messages.ERROR, f'this contact with username:{form.cleaned_data["email"]} not found')
                logger.error("this contact with username:{form.cleaned_data['email']} not found so not saved")
                return redirect('/')

            contact_obj = Contact(first_name=form.cleaned_data['first_name'],
                                  last_name=form.cleaned_data['last_name'],
                                  email=form.cleaned_data['email'],
                                  other_emails=form.cleaned_data['other_emails'],
                                  phone_number=form.cleaned_data['phone_number'],
                                  birth_date=form.cleaned_data['birth_date'],
                                  user=User.objects.get(id=request.user.id)
                                  )
            contact_obj.save()

            return redirect("/contacts/all-contacts")
        logger.error('contact form not valid')
        return HttpResponse(f'errors:{form.errors}')


class ContactList(LoginRequiredMixin, ListView):
    def get(self, request):
        contacts_of_user = Contact.objects.filter(user=request.user.id)

        return render(request, 'contacts/contact_list.html', {'contacts_of_user': contacts_of_user})


class ContactDetail(LoginRequiredMixin, DetailView):
    model = Contact


class UpdateContact(LoginRequiredMixin, UpdateView):
    model = Contact
    template_name = 'contacts/edite_contact.html'
    fields = ['first_name', 'last_name', 'email', 'birth_date', 'phone_number', 'other_emails']
    success_url = '/'


class DeleteContact(LoginRequiredMixin, DeleteView):
    model = Contact
    success_url = '/'


def export_csv_contacts_list(request):
    contacts = Contact.objects.all().filter(user=request.user)
    response = HttpResponse('')
    response['Content-Disposition'] = 'attachment; filename=contacts.csv'
    writer = csv.writer(response)
    writer.writerow(['first_name', 'last_name', 'email', 'other_emails', 'phone_number', 'birth_date'])
    contacts = contacts.values_list('first_name', 'last_name', 'email', 'other_emails', 'phone_number', 'birth_date')
    for contact in contacts:
        writer.writerow(contact)
    return response


class SearchByFieldContact(LoginRequiredMixin, View):

    def get(self, request):
        fields_contacts_list = Contact.objects.all().filter(user=request.user.id).values_list('first_name', 'last_name',
                                                                                              'email', 'other_emails',
                                                                                              'phone_number')
        r = list(itertools.chain(*fields_contacts_list))
        res = [i for i in r if i]
        print(res)
        return render(request, 'contacts/search_fields_contact.html', {'res': res})

    def post(self, request):
        contact = request.POST['search_field']
        result = Contact.objects.all().filter(Q(user=request.user) & (
                Q(first_name__startswith=contact) | Q(last_name__startswith=contact) |
                Q(email__startswith=contact) | Q(other_emails__startswith=contact) | Q(
            phone_number__startswith=contact)))
        return render(request, 'contacts/result_search_contact.html', {'result': result})


@login_required
def search_contacts(req):
    if req.method == 'POST':
        contact = req.POST.get('text')
        if not contact:
            json_data = json.loads(req.body)
            contact = json_data['text']

        result = Contact.objects.all().filter(Q(user=req.user) & (
                Q(first_name__contains=contact) | Q(last_name__contains=contact) |
                Q(email__contains=contact) |
                Q(other_emails__contains=contact, other_emails__isnull=False) |
                Q(phone_number__contains=contact, phone_number__isnull=False)
        ))
        contact_list = list(result.values('first_name',
                                          'last_name',
                                          'email',
                                          'other_emails',
                                          'phone_number',
                                          'pk'))

        if result:
            return JsonResponse({
                'contacts': contact_list,
            })
        else:
            return JsonResponse({
                'contacts': [],
                'msg': "doesn't match any contacts",
            })
    else:
        return render(req, 'contacts/search_contact_box.html', {})