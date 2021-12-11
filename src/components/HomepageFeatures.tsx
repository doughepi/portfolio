import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

type FeatureItem = {
  title: string;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'What is this?',
    description: (
      <>
        This is my combination blog and portfolio site. I'll be posting about
        my experiences, my projects, and my thoughts. There may also be some of my interests
        and hobbies. You never know!
      </>
    ),
  },
  {
    title: 'Who am I?',
    description: (
      <>
        I am a Minneapolis based Cloud Engineer and Backend Software Engineer. When I'm not writing code, you can usually find me at a jazz club
        or micromanaging my personal finances with various plaintext accounting tools.
      </>
    ),
  },
  {
    title: 'What I do.',
    description: (
      <>
        I'm particularly interested in methods for automation and developer productivity.
        For example, internal tools for managing projects, managing deployment pipelines, and
        automated infrastructure provisioning with infrastructure as code technologies.
      </>
    ),
  },
];

function Feature({ title, description }: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
